class UserInterest < ApplicationRecord
  belongs_to :user
  belongs_to :interest
  validates :interest, presence: true
end
