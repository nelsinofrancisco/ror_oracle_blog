class LikesController < ApplicationController
  def create
    @like = Like.new(params.require(:like).permit(:author_id, :post_id))

    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Question saved successfully'
          redirect_back(fallback_location: root_path)
        else
          flash.now[:error] = 'Error: Question could not be saved'
        end
      end
    end
  end
end