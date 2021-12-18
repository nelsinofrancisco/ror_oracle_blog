class PostsController < ApplicationController
  def index
    @logged_user = current_user
    @user = User.find_by_id(params[:user_id])
    @pagy, @all_posts = pagy(@user.posts.order(id: :desc), items: 2) if @user
    create_models
  end

  def show
    @logged_user = current_user
    @current_post = Post.find_by_id(params[:id])
    create_models
  end

  def new
    @logged_user = current_user
    @recent_posts = @logged_user.recent_posts
  end

  def create
    check_models
  end
end
