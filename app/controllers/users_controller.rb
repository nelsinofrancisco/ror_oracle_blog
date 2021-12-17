class UsersController < ApplicationController
  def index
    @logged_user = self.current_user
  end

  def show
    @logged_user = self.current_user
    @user = User.find(params[:id])
    @recent_posts = @user.recent_posts
  end

  def new
    @logged_user = self.current_user
  end
end
