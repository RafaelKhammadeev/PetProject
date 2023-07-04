class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_rich_text :body
  validates :body, length: { minimum: 2, maximum: 400 }
end
