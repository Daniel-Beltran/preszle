class Bookmark < ApplicationRecord
  belongs_to :article
  belongs_to :list
end
