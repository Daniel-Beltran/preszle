class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :articles, through: :bookmarks
  validates :name, length: {maximum: 25}, allow_blank: false
end
