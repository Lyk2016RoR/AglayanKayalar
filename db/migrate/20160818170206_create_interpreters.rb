class CreateInterpreters < ActiveRecord::Migration[5.0]
  def change
    create_table :interpreters do |t|
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
