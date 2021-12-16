class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @pagy, @all_posts = pagy(@user.posts, items: 2) if @user
  end

  def show
    @post = Post.find_by_id(params[:id])
  end
end
