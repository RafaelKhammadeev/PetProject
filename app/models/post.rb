class Post < ApplicationRecord
  extend Enumerize

  belongs_to :user

  STATUS = %w[draft public test].freeze

  enumerize :status, in: STATUS

  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }
end
