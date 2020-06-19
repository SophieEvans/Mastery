class InteractionsController < ApplicationController
  def create
    # find the video
    @video = Video.find(params[:video_id])
    @video.helpful = 0 if @video.helpful.nil?
    @video.good_style = 0 if @video.good_style.nil?
    # check whether interaction exists (use activerecord find_by method)
    @interaction = Interaction.find_or_initialize_by(user_id: current_user.id, video_id: @video.id)
    authorize @interaction

    if interaction_params[:completed].present?
      @interaction.completed = !@interaction.completed
    end
    
    if interaction_params[:helpful].present?
      @video.helpful += @interaction.helpful ? -1 : 1
      @interaction.helpful = !@interaction.helpful
    end

    if interaction_params[:good_style].present?
      @video.good_style += @interaction.good_style ? -1 : 1
      @interaction.good_style = !@interaction.good_style
    end

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

    # if interaction_params[:completed].present?
        # Redirect back to other page
      # redirect_to "#{root_url}/videos/dashboard" and return
    # else
      # redirect user to show

    # progress_count
    if interaction_params[:completed].present?
      rookie_videos = Video.joins(:sub_category).where(sub_categories: {difficulty: "rookie"}).uniq {|v| v.sub_category.name}
      intermediate_videos = Video.joins(:sub_category).where(sub_categories: {difficulty: "intermediate"}).uniq {|v| v.sub_category.name}
      pro_videos = Video.joins(:sub_category).where(sub_categories: {difficulty: "pro"}).uniq {|v| v.sub_category.name}
      
      completedRookieVideos = Video.joins(:interactions,:sub_category).where("sub_categories.difficulty = 'rookie' and interactions.user_id = #{current_user.id} and completed = true").uniq {|v| v.sub_category.name}
      completedInterVideos = Video.joins(:interactions,:sub_category).where("sub_categories.difficulty = 'intermediate' and interactions.user_id = #{current_user.id} and completed = true").uniq {|v| v.sub_category.name}
      completedProVideos = Video.joins(:interactions, :sub_category).where("sub_categories.difficulty = 'pro' and interactions.user_id = #{current_user.id} and completed = true").uniq {|v| v.sub_category.name}
      
      @rookie_completed_count = "#{completedRookieVideos.count}/#{@rookie_videos.count}"
      @intermediate_completed_count = "#{completedInterVideos.count}/#{@intermediate_videos.count}"
      @pro_completed_count = "#{completedProVideos.count}/#{@pro_videos.count}"
      @rookie_count = rookie_videos.count
      @intermediate_count = intermediate_videos.count
      @pro_count = pro_videos.count
      
      # @rookie_completed_count = completedRookieVideos.count
      # @intermediate_completed_count = completedInterVideos.count
      # @pro_completed_count = completedProVideos.count
    end

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
