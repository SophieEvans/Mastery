class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @videos = Video.global_search(params[:query])
    else
      @videos = policy_scope(Video)
    end
  end

  def show
    @video = Video.find(params[:id])
    authorize @video
  end
end
