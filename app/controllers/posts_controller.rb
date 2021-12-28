class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @logged_user = current_user
    @user = User.find_by_id(params[:user_id])
    @pagy, @all_posts = pagy(Post.where(author_id: @user.id).order(id: :desc), items: 2) if @user
  end

  def show
    @logged_user = current_user
    @current_post = Post.find_by_id(params[:id])
  end

  def new
    @logged_user = current_user
    @recent_posts = @logged_user.recent_posts
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Question saved successfully'
        else
          flash[:error] = 'Error: Question could not be saved'
        end
        redirect_back(fallback_location: root_path)
      end
    end
  end

  def destroy
    current_uri = request.env['PATH_INFO']
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(params[:user_id])

    if @post.destroy
      flash[:success] = 'Post Deleted Successfully'
      if current_uri.include?("/posts/#{params[:id]}")
        redirect_to user_posts_path(@user.id)
      else
        redirect_back(fallback_location: root_path)
      end
    else
      flash.now[:danger] = 'You have not access'
    end
  end

  private

  def post_params
    params.require(:post).permit(:author_id, :title, :text, :text, :comments_counter, :likes_counter)
  end
end
