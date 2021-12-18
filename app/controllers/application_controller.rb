class ApplicationController < ActionController::Base
  include Pagy::Backend

  def current_user
    User.first
  end

  private

  def create_models
    @post = Post.new
    @comment = Comment.new
    @like = Like.new
  end

  def check_models
    begin
      params.require(:post)
    rescue StandardError
      # Do nothing
    else
      handle_post_creation
    end

    begin
      params.require(:comment)
    rescue StandardError
      # Do nothing
    else
      handle_comment_creation
    end

    begin
      params.require(:like)
    rescue StandardError
      # Do nothing
    else
      handle_like_creation
    end
  end

  def handle_post_creation
    @post = Post.new(params.require(:post).permit(:author_id, :title, :text, :text, :comments_counter, :likes_counter))

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Question saved successfully'
          redirect_to user_posts_path(@post.user.id)
        else
          flash.now[:error] = 'Error: Question could not be saved'
        end
      end
    end
  end

  def handle_comment_creation
    @comment = Comment.new(params.require(:comment).permit(:author_id, :post_id, :text))

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Question saved successfully'
          redirect_to request.referrer
        else
          flash.now[:error] = 'Error: Question could not be saved'
        end
      end
    end
  end

  def handle_like_creation
    @like = Like.new(params.require(:like).permit(:author_id, :post_id))

    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Question saved successfully'
          redirect_to request.referrer
        else
          flash.now[:error] = 'Error: Question could not be saved'
        end
      end
    end
  end
end
