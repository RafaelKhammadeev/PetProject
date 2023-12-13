class Comment < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :posts, through: :post_comments

  validates :text, presence: true, length: { maximum: 500 }
end
