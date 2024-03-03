class Post < ApplicationRecord
  extend Enumerize
  STATUS = %w[draft public test].freeze

  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }

  enumerize :status, in: STATUS, predicates: { prefix: true }
end
