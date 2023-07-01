class PagesController < ApplicationController
  def home
    @posts = Post.where(status: 'Public')
  end

  def support
    @feedbacks = Feedback.all
  end
end
