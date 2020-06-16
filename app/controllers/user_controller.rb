class UserController < ApplicationController
  def index
    if params[:query].present?
      @users = Video.global_search(params[:query])
    elsif params[:status]
      status_name = params[:status]
      @users = User.where(status: status_name)
    else
      @users = policy_scope(User)
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @user_videos = Video.where(user: @user)
  end
end
