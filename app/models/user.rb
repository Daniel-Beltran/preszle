class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :lists
  has_many :user_interests
  has_many :interest, through: :user_interests

  # validates :user_name, presence: true, uniqueness: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
end
