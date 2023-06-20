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

    def edit
    end

    def create
      @contact_message = current_user.contact_messages.new(contact_message_params)
      if @contact_message.save
        redirect_to admin_contact_messages_path, notice: 'Thank you for your message!'
      else
        render :new
      end
    end

    def update
      if @contact_message.update(post_params)
        redirect_to admin_contact_messages_path, success: 'Message was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @contact_message.destroy
      redirect_to admin_contact_messages_path, success: 'Message was successfully destroyed.'
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
