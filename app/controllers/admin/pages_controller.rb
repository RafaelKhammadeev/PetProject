module Admin
  class PagesController < ApplicationController
    def support
      @contact_messages = Admin::ContactMessage.all
    end
  end
end
