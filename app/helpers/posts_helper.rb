module PostsHelper
  include Pagy::Frontend

  def render_posts
    return content_tag(:h1, "This user doesn't exist") unless @user

    if @all_posts
      all_posts_text = @all_posts.map do |post|
        post.text.truncate(100)
      end
    end

    render partial: '_partials/user_full_posts',
           locals: { user: @user, posts: @all_posts, posts_text: all_posts_text }
  end

  def render_post
    return content_tag(:h1, "This post doesn't exist yet") unless @post

    concat(render(partial: '_partials/cards/post_card', locals: { post: @post, text: @post.text }))

    concat(render(partial: '_partials/cards/comment_card', locals: { post: @post }))

    content_tag(:span, '', class: 'p-05')
  end
end
