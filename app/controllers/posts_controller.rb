class PostsController < ApplicationController
  def index
    @posts = Post.where(status: 'Public')
  end
end
