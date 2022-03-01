class Interest < ApplicationRecord
  has_many :articles
  has_many :user_interests, dependent: :destroy
end
