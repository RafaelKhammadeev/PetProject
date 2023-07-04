class Feedback < ApplicationRecord
  belongs_to :user

  validates :title, length: { minimum: 2, maximum: 100 }
  validates :message, length: { minimum: 10, maximum: 500 }
end
