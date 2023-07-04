class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  enum :status, { draft: 0, public: 1 }, prefix: true

  validates :title, length: { minimum: 2, maximum: 100 }
end
