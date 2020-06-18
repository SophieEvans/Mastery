class InteractionsController < ApplicationController
  def create
    # find the video
    @video = Video.find(params[:video_id])
    @video.helpful = 0 if @video.helpful.nil?
    @video.good_style = 0 if @video.good_style.nil?
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
    @interaction.completed = interaction_params[:completed] if interaction_params[:completed].present?
    @interaction.save
      # redirect user to show

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
    #
    if interaction_params[:completed].present?
      # Redirect back to other page
      redirect_to "#{root_url}/videos/dashboard" and return
    else

      if interaction_params[:helpful].present?
        @interaction.helpful = !@interaction.helpful
        if @interaction.helpful
          @video.helpful += 1
        else
          @video.helpful -= 1
        end
      end

      if interaction_params[:good_style].present?
        @interaction.good_style = !@interaction.good_style
        if @interaction.good_style
          @video.good_style += 1
        else
          @video.good_style -= 1
        end
      end

      # Work in progress
      if interaction_params[:upvote].present?
        if @interaction.vote
          @video.rating -= 1
        elsif @interaction.vote.nil?
          @video.rating += 1
        else
          @video.rating += 2
        end
        @interaction.vote = @interaction.vote ? nil : true
      end

      if interaction_params[:vote].present?
        if @interaction.vote
          @video.rating -= 2
        elsif @interaction.vote.nil?
          @video.rating -= 1
        else
          @video.rating += 1
        end
        @interaction.vote = @interaction.vote ? false : (@interaction.vote==nil ? false : nil)
      end

      @interaction.save
      @video.save
      # redirect user to show
      respond_to do |format|
        format.html { redirect_to @video }
        format.js
      end
    end
  end

  private

  def interaction_params
    params.require(:interaction).permit(:completed, :helpful, :good_style, :vote, :upvote)
  end
end
