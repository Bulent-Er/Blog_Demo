class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def show
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Comment has not been created"
      render 'posts/show'
    end
  end
  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entit, alert: "Comment was not  updated." }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
