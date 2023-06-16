module Admin
  class ContactMessage < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { minimum: 5, maximum: 100 }
    validates :message, presence: true , length: { minimum: 10, maximum: 500}
  end
end
