class LikesController < ApplicationController
  load_and_authorize_resource
  def create
    @like = Like.new(like_params)

    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Like saved successfully'
          redirect_back(fallback_location: root_path)
        else
          flash.now[:error] = 'Error: Like could not be saved'
        end
      end
    end
  end


  private

  def like_params 
    params.require(:like).permit(:author_id, :post_id)
  end
end
