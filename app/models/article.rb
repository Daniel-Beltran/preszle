class Article < ApplicationRecord
  belongs_to :interest
  has_many :reviews
  has_many :bookmarks

  validates :title, :text, :author, :source, :source_url, presence: true
end
