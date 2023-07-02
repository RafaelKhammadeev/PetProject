class Post < ApplicationRecord
  belongs_to :user

  enum :status, { draft: 0, public: 1 }, prefix: true

  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
end
