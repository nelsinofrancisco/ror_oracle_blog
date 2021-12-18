class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params.require(:comment).permit(:author_id, :post_id, :text))

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
end