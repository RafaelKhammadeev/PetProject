class PagesController < ApplicationController
  def home
    @posts = Post.where(status: 'public')
  end

  def support
    @feedbacks = Feedback.all
  end
end
