class PostsController < ApplicationController
  def index
    @logged_user = current_user
    @user = User.find_by_id(params[:user_id])
    @pagy, @all_posts = pagy(@user.posts.order(id: :desc).includes(:comments), items: 2) if @user
  end

  def show
    @logged_user = current_user
    @current_post = Post.find_by_id(params[:id])
  end

  def new
    @logged_user = current_user
    @recent_posts = @logged_user.recent_posts.includes(:comments)
  end

  def create
    @post = Post.new(params.require(:post).permit(:author_id, :title, :text, :text, :comments_counter, :likes_counter))

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Question saved successfully'
          redirect_back(fallback_location: root_path)
        else
          flash[:error] = 'Error: Question could not be saved'
          redirect_back(fallback_location: root_path)
        end
      end
    end
  end
end
