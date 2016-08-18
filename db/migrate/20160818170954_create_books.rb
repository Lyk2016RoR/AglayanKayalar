class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.integer :page_count
      t.date :publication_year
      t.integer :ISBN
      t.references :category, foreign_key: true
      t.references :author, foreign_key: true
      t.references :publisher, foreign_key: true
      t.references :interpreter, foreign_key: true

      t.timestamps
    end
  end
end
