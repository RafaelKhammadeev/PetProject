class FeedbacksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feedback, only: %i[edit update destroy]

  def index
    @feedbacks = current_user.feedbacks
  end

  def new
    @feedback = Feedback.new
  end

  def edit
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)
    if @feedback.save
      FeedbackMailer.new_feedback(current_user, @feedback).deliver_later
      redirect_to feedbacks_path, notice: "Thank you for your feedback!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to feedbacks_path, success: "Feedback was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @feedback.destroy
    redirect_to feedbacks_path, success: "Feedback was successfully destroyed."
  end

  private

  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  def feedback_params
    params.require(:feedback).permit(:title, :email, :message)
  end
end
