class Article < ApplicationRecord
  belongs_to :interest
  has_many :reviews
  has_many :bookmarks

  validates :description, :title, :source, :source_url, presence: true
  #validates :title, uniqueness: true
end
