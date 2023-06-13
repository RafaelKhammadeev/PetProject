class MainPageController < ApplicationController
  def index
    @posts = Post.where(status: 'Public')
  end
end
