class Article < ApplicationRecord
  belongs_to :interest
  has_many :reviews
  has_many :bookmarks, dependent: :destroy

  validates :title, :content, :author, :source, :source_url, presence: true
end
