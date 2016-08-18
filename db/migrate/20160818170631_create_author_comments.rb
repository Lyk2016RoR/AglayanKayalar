class CreateAuthorComments < ActiveRecord::Migration[5.0]
  def change
    create_table :author_comments do |t|
      t.text :body
      t.references :author, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
