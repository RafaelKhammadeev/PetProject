class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :feedbacks, dependent: :destroy

  enum :role, { user: 0, admin: 1 }

  validates :name, :surname, presence: true, length: { minimum: 2, maximum: 50 }
end
