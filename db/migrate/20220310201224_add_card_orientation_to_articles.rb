class AddCardOrientationToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :card_orientation, :string, default: "horizontal"
  end
end
