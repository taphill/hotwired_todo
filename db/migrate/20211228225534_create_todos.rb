class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
