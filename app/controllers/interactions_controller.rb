class InteractionsController < ApplicationController
  def create
    # find the video
    @video = Video.find(params[:video_id])
    # check whether interaction exists (use activerecord find_by method)
    @interaction = Interaction.find(params[user_id: current_user.id], [video_id: @video_id])
    # if exists we update
    if @interaction
      if @interaction.update(interaction_params[completed: !@interaction.completed])
        flash[:success] = "Marked as mastered"
      else
        flash[:error] = "Something went wrong"
      end
    # else we create and set boolean as true
    else
      @interaction = Interaction.new(user_id: current_user.id, video_id: @video.id, completed: true)
      if @interaction.save
        flash[:success] = "Marked as mastered"
      else
        flash[:error] = "Something went wrong"
      end
      # redirect user to show
      authorize @interaction
      redirect_to @video
    end
  end

  private

  def interaction_params
    params.require(:interaction).permit(:completed)
  end
end
