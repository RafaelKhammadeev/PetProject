class ContactMessageMailer < ApplicationMailer
  default to: -> { User.where(admin: true).pluck(:email) }

  def new_contact_message(user, contact_message)
    @user = user
    @contact_message = contact_message
    mail(subject: 'Message for Supporting', from: @user.email)
  end
end
