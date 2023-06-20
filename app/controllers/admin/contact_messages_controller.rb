module Admin
  class ContactMessagesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_contact_message, only: %i[edit update destroy]

    def index
      @contact_messages = current_user.contact_messages
    end

    def new
      @contact_message = Admin::ContactMessage.new
    end

    def create
      @contact_message = current_user.contact_messages.new(contact_message_params)
      if @contact_message.save
        ContactMessageMailer.new_contact_message(current_user, @contact_message).deliver_later
        redirect_to admin_contact_messages_path, notice: 'Thank you for your message!'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @contact_message.update(post_params)
        redirect_to admin_contact_messages_path, success: 'post was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_contact_message
      @contact_message = ContactMessage.find(params[:id])
    end

    def contact_message_params
      params.require(:admin_contact_message).permit(:title, :email, :message)
    end
  end
end
