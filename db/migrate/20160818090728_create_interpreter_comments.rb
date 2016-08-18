class CreateInterpreterComments < ActiveRecord::Migration[5.0]
  def change
    create_table :interpreter_comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :interpreter, foreign_key: true

      t.timestamps
    end
  end
end
