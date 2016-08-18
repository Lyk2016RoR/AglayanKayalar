class CreateBookComments < ActiveRecord::Migration[5.0]
  def change
    create_table :book_comments do |t|
      t.text :body
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
