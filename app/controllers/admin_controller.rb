class AdminController < ApplicationController
  def index
  end

  def posts
    # @posts = Post.all
    @posts = Post.all.includes(:user, :comments)

  end

  def comments
  end

  def users
  end

  def show_post
    @post = Post.includes(:user, :comments).find(params[:custom_slug])
  end
end
