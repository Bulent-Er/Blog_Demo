class AdminController < ApplicationController
  def index
  end

  def posts
    @posts = Post.all.includes(:user)
  end

  def comments
  end

  def users
  end

  def show_post
    @post = Post.includes(:user, comments: [:user, :rich_text_body]).find(params[:custom_slug])
    # @comments = @post.comments.includes(:user, :rich_text_body).order(created_at: :desc)
  end
end
