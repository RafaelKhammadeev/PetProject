class Post < ApplicationRecord
  extend Enumerize

  belongs_to :user

  enumerize :status, in: %w[Draft Public]

  validates :title, presence: true, length: { minimum: 5, maximum:50 }
end
