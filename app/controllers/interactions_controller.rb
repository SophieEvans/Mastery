class InteractionsController < ApplicationController
  def create
    # find the video
    @video = Video.find(params[:video_id])
    # check whether interaction exists (use activerecord find_by method)
    @interaction = Interaction.find_or_initialize_by(user_id: current_user.id, video_id: @video.id)
    authorize @interaction
    # if exists we update
    if @interaction.persisted?
      if @interaction.update(interaction_params)
        flash[:success] = "Marked as mastered"
      else
        flash[:error] = "Something went wrong"
      end
    # else we create and set boolean as true
    else
      @interaction = Interaction.new(interaction_params)
      @interaction.video = @video
      @interaction.user = current_user
      if @interaction.save
        flash[:success] = "Marked as mastered"
      else
        flash[:error] = "Something went wrong"
      end
      # redirect user to show
    end
    redirect_to @video
  end  

  private

  def interaction_params
    params.require(:interaction).permit(:completed, :helpful, :good_style, :vote)
  end
end
