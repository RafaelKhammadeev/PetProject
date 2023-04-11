class Post < ApplicationRecord
  belongs_to :user

  validates :title, :text, presence: true
end
