class CreateBcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :bcomments do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.text :body
      t.integer :rating
      t.timestamps
    end
  end
end
