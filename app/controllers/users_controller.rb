class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
  end

  def new
    @logged_user = current_user
     
  end
end
