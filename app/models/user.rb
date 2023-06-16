class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :admin_contact_messages, :class_name => 'Admin::ContactMessage', dependent: :destroy

  validates :name, :surname, presence: true, length: { minimum: 2, maximum: 50 }
end
