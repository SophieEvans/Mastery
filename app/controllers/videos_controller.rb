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
    @rookie_videos = Video.where(sub_category.difficulty = "rookie").includes(:interactions)
    @intermediate_videos = Video.where(sub_category.difficulty = "Intermediate").includes(:interactions)
    @pro_videos = Video.where(sub_category.difficulty = "pro").includes(:interactions)
  end

  def search
    @videos = policy_scope(Video)
  end

  private

  def video_params
    params.require(:video).permit(:cloudinary_video_id, :title, :sub_category_id)
  end
end
