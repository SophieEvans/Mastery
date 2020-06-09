class VideosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @videos = policy_scope(Video)
  end

  def show
    @video = Video.find(params[:id])
    authorize @video
  end
end
