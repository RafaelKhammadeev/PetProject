class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: %i[show edit update destroy]
  # TODO: создать отедельно index main для index posts
  before_action :authenticate_user!, only: %i[new update show index]
  before_action -> { authorize! @post }, only: %i[edit update destroy]

  def index
    @posts = @user.posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_post_path(@user, @post), success: 'post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post), success: 'post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, success: 'post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :description, :status)
  end
end
