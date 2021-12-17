class UsersController < ApplicationController
  def index
    @logged_user = current_user
  end

  def show
    @logged_user = current_user
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
  end

  def new
    @logged_user = current_user

  end
end
