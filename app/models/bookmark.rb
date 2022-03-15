class Bookmark < ApplicationRecord
  belongs_to :article
  belongs_to :list
  #validates :article, uniqueness: {scope: :list_id, message: "is already in the list"}
end
