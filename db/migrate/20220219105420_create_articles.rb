class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.date :date_published
      t.string :title
      t.text :content
      t.string :source_url
      t.integer :reading_time
      t.string :source
      t.string :author
      t.references :interest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
