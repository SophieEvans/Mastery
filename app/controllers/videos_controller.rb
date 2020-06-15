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
        @interaction = Interaction.new(user_id: current_user.id, video_id: video_id, completed: true)
      end
    end
  end

  def dashboard
    @rookie_videos = Video.where(difficulty: "rookie")
    @intermediate_videos = Video.where(difficulty: "Intermediate")
    @pro_videos = Video.where(difficulty: "pro")
    authorize @rookie_videos
  end
end
