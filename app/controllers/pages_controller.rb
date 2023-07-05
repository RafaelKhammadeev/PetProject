class PagesController < ApplicationController
  def home
    @posts = Post.where(status: 'public').order(created_at: :desc)
  end

  def support
    @feedbacks = Feedback.all
  end
end
