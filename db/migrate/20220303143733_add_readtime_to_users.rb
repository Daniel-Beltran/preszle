class AddReadtimeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :readtime, :integer, default: 15
  end
end
