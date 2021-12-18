module PostsHelper
  include Pagy::Frontend

  def render_posts
    return content_tag(:h1, "This user doesn't exist") unless @user

    if @all_posts
      all_posts_text = @all_posts.map do |post|
        post.text.truncate(100)
      end
    end

    concat(render(partial: '_partials/navbar/nav'))

    render partial: '_partials/user_full_posts',
           locals: { user: @user, posts: @all_posts, posts_text: all_posts_text, url: user_posts_path(@user.id) }
  end

  def render_post
    return content_tag(:h1, "This post doesn't exist yet") unless @post

    render partial: '_partials/user_full_post'
  end

  def render_user_new
    return content_tag :h1, 'Page in development' unless @logged_user

    unless @logged_user.id == params[:user_id].to_i
      return content_tag :h1, "You can't post in behalf of another another"
    end

    recent_posts_text = @recent_posts.map do |post|
      post.text.truncate(100)
    end

    concat(render(partial: '_partials/navbar/nav'))
    render partial: '_partials/user_full_add_post',
           locals: { user: @logged_user, posts: @recent_posts, posts_text: recent_posts_text,
                     url: user_posts_path(@logged_user.id) }
  end
end
