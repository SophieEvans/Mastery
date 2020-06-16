class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    if params[:completed]
      video_id = @video.id
      if Interaction.exists?(user_id: current_user.id, video_id: video_id)
        interaction = Interaction(user_id: current_user.id, video_id: video_id)
        if interaction.completed == true
          interaction.completed = false
        else
          interaction.completed = true
        end
      else
        @interaction = Interaction.create!(user_id: current_user.id, video_id: video_id, completed: true)
      end
    end
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
    @rookie_videos = Video.where(difficulty: "rookie")
    @intermediate_videos = Video.where(difficulty: "Intermediate")
    @pro_videos = Video.where(difficulty: "pro")
    authorize @rookie_videos
  end

  private

  def video_params
    params.require(:video).permit(:external_file, :title, :sub_category_id)
  end
end
