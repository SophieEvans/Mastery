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
      @videos = policy_scope(Video)
    end
  end

  def show
    @video = Video.find(params[:id])
    authorize @video
    @video.helpful = 0 if @video.helpful.nil?
    @video.good_style = 0 if @video.good_style.nil?
    @interaction = Interaction.find_by(user_id: current_user.id, video_id: @video.id)
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
    @rookie_videos = Video.joins(:sub_category).where(sub_categories: {difficulty: "rookie"}).uniq {|v| v.sub_category.name}
    @intermediate_videos = Video.joins(:sub_category).where(sub_categories: {difficulty: "intermediate"}).uniq {|v| v.sub_category.name}
    @pro_videos = Video.joins(:sub_category).where(sub_categories: {difficulty: "pro"}).uniq {|v| v.sub_category.name}

    @my_videos = Video.where(user_id: 1)

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
