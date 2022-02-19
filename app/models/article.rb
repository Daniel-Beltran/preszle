class Article < ApplicationRecord
  belongs_to :interest
  has_many :reviews
  has_many :bookmarks
end
