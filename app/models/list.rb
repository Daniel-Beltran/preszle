class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks
  has_many :articles, through: :bookmarks
end
