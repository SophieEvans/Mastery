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
    @interaction = Interaction.find_by(user_id: current_user.id, video_id: @video.id)
  end

  def dashboard
    @rookie_videos = Video.where(difficulty: "rookie").includes(:interactions)
    @intermediate_videos = Video.where(difficulty: "Intermediate").includes(:interactions)
    @pro_videos = Video.where(difficulty: "pro").includes(:interactions)
  end
end
