class PostsController < ApplicationController
  def index
    @logged_user = self.current_user
    @user = User.find_by_id(params[:user_id])
    @pagy, @all_posts = pagy(@user.posts, items: 2) if @user
  end

  def show
    @logged_user = self.current_user
    @post = Post.find_by_id(params[:id])
  end
end
