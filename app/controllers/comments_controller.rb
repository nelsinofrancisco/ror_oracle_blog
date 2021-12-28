class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Question saved successfully'
          redirect_back(fallback_location: root_path)
        else
          flash.now[:error] = 'Error: Question could not be saved'
        end
      end
    end
  end

  def destroy
    @post = Post.find_by_id(params[:post_id])
    @user = User.find_by_id(@post.author_id)
    @comment = Comment.find_by_id(params[:id])

    if @comment.destroy
      flash[:success] = 'Comment Deleted Successfully'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:error] = 'You have not access'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :text)
  end
end
