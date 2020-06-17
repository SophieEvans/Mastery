class InteractionsController < ApplicationController
  def create
    # find the video
    @video = Video.find(params[:video_id])
    # check whether interaction exists (use activerecord find_by method)
    @interaction = Interaction.find_or_initialize_by(user_id: current_user.id, video_id: @video.id)
    authorize @interaction
    # if exists we update
    unless @interaction.persisted?
      @interaction = Interaction.new(interaction_params)
      @interaction.video = @video
      @interaction.user = current_user
    end

    @interaction.helpful = !@interaction.helpful if interaction_params[:helpful].present?
    @interaction.good_style = !@interaction.good_style if interaction_params[:good_style].present?
    
    # Work in progress
    #if interaction_params[:vote].present?
      #@interaction.vote = interaction_params[:vote]
    #case @interaction.vote
    #when true
      #@interaction.vote = nil
    #when nil
      #@interaction.vote 
    #when false
      #@interaction.vote = nil

    @interaction.save
      # redirect user to show
    respond_to do |format|
      format.html { redirect_to @video }
      format.js
    end
  end  

  private

  def interaction_params
    params.require(:interaction).permit(:completed, :helpful, :good_style, :vote)
  end
end
