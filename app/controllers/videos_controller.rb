class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    if params[:query].present?
      @videos = Video.global_search(params[:query])
    elsif params[:sub_category]
      sub_category_name = params[:sub_category]
      sub_category = SubCategory.find_by_name(sub_category_name)
      @videos = sub_category.videos
    else
      @videos = policy_scope(Video.includes(:sub_category))
    end
  end

  def show
    @video = Video.find(params[:id])
    authorize @video
    @video.helpful = 0 if @video.helpful.nil?
    @video.rating = 0 if @video.rating.nil?
    @video.good_style = 0 if @video.good_style.nil?
    @interaction = Interaction.find_or_initialize_by(user_id: current_user.id, video_id: @video.id) if user_signed_in?
  end

  def new
    @video = Video.new
    authorize @video
  end

  def create
    @video = Video.new(video_params)
    authorize @video
    @video.user = current_user
    if @video.save
      flash[:notice] = "Video successfully created"
      redirect_to @video
    else
      flash[:alert] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    authorize @video
    @video.external_file.purge
    if @video.destroy
      flash[:notice] = 'Video was successfully deleted.'
      redirect_to videos_url
    else
      flash[:alert] = 'Something went wrong'
      redirect_to videos_url
    end
  end

  def dashboard
    @rookie_videos = Video.joins(:sub_category).order(created_at: :desc).where(sub_categories: {difficulty: "rookie"}).uniq {|v| v.sub_category.name}
    @intermediate_videos = Video.joins(:sub_category).order(created_at: :desc).where(sub_categories: {difficulty: "intermediate"}).uniq {|v| v.sub_category.name}
    @pro_videos = Video.joins(:sub_category).order(created_at: :desc).where(sub_categories: {difficulty: "pro"}).uniq {|v| v.sub_category.name}

    completedRookieVideos = Video.joins(:interactions,:sub_category).where("sub_categories.difficulty = 'rookie' and interactions.user_id = #{current_user.id} and completed = true").uniq {|v| v.sub_category.name}
    @rookie_completed_count = "#{completedRookieVideos.count}/#{@rookie_videos.count}"
    completedInterVideos = Video.joins(:interactions,:sub_category).where("sub_categories.difficulty = 'intermediate' and interactions.user_id = #{current_user.id} and completed = true").uniq {|v| v.sub_category.name}
    @intermediate_completed_count = "#{completedInterVideos.count}/#{@intermediate_videos.count}"
    completedProVideos = Video.joins(:interactions, :sub_category).where("sub_categories.difficulty = 'pro' and interactions.user_id = #{current_user.id} and completed = true").uniq {|v| v.sub_category.name}
    @pro_completed_count = "#{completedProVideos.count}/#{@pro_videos.count}"

  #   @interactions_rookie = @rookie_videos.each do |video|
  #     interaction = Interaction.where(user_id: current_user.id, video_id: video.id)
  #     if interaction.completed == true
  #       @score = current_user.rookie_completed += 1
  #     end
  #   end

  end

  def search
    @videos = policy_scope(Video)
  end

  private

  def video_params
    params.require(:video).permit(:cloudinary_video_id, :title, :sub_category_id)
  end
end
