class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_post
  before_action :set_comment, only: %i[update destroy]

  def create

    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created.'
    else
      render user_post_path(@user, @post), status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully updated.'
    else
      render user_post_path(@user, @post), status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to user_post_path(@user, @post), notice: 'Comment was successfully destroyed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
