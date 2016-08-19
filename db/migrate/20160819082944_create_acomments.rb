class CreateAcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :acomments do |t|
      t.text :body
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
