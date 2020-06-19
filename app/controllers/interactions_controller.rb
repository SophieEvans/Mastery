class InteractionsController < ApplicationController
  def create
    # find the video
    @video = Video.find(params[:video_id])
    @video.helpful = 0 if @video.helpful.nil?
    @video.good_style = 0 if @video.good_style.nil?
    @video.rating = 0 if @video.rating.nil?
    # check whether interaction exists (use activerecord find_by method)
    @interaction = Interaction.find_or_initialize_by(user_id: current_user.id, video_id: @video.id)
    authorize @interaction
    # if exists we update
    #unless @interaction.persisted?
      #@interaction = Interaction.new(interaction_params)
      #@interaction.video = @video
      #@interaction.user = current_user
    #end

    @interaction.completed = !@interaction.completed if interaction_params[:completed].present?

    if interaction_params[:helpful].present?
      @video.helpful += @interaction.helpful ? -1 : 1
      @interaction.helpful = !@interaction.helpful
    end

    if interaction_params[:good_style].present?
      @video.good_style += @interaction.good_style ? -1 : 1
      @interaction.good_style = !@interaction.good_style
    end


    if interaction_params[:upvote].present?
  if @interaction.vote.nil?
    @video.rating += 1
    @interaction.vote = true
  elsif @interaction.vote == false # They had already voted against this video now changed their mind, so we are just removing their vote.
    @video.rating += 1
    @interaction.vote = nil
  end
end
if interaction_params[:vote].present?
  if @interaction.vote.nil?
    @video.rating -= 1
    @interaction.vote = false
  elsif @interaction.vote == true # They had already voted for this video now changed their mind, so we are just removing their negative vote.
    @video.rating -= 1
    @interaction.vote = nil
  end
end

    @interaction.save
    @video.save

    # if interaction_params[:completed].present?
        # Redirect back to other page
      # redirect_to "#{root_url}/videos/dashboard" and return
    # else
      # redirect user to show
    respond_to do |format|
      format.html { redirect_to @video }
      format.js
    end
    # end
  end

  private

  def interaction_params
    params.require(:interaction).permit(:completed, :helpful, :good_style, :vote, :upvote)
  end
end
