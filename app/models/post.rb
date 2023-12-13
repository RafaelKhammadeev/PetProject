class Post < ApplicationRecord
  belongs_to :user

  enum :status, { draft: 0, public: 1 }, prefix: true

  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 400 }
end
