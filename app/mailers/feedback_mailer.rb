class FeedbackMailer < ApplicationMailer
  default to: -> { User.where(role: 'admin').pluck(:email) }

  def new_feedback(user, feedback)
    @user = user
    @feedback = feedback
    mail(subject: "Feedback: #{@feedback.title}", from: @user.email)
  end
end
