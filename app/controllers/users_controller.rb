class UsersController < ApplicationController
  def index
    @logged_user = current_user
  end

  def show
    @logged_user = current_user
    @user = User.find_by_id(params[:id])
    @recent_posts = @user.recent_posts
  end
end
