class PagesController < ApplicationController
  def home
    @posts = Post.where(status: 'Public')
  end
end
