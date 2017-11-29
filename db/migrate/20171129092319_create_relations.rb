class CreateRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :relations do |t|
      t.references :subscriber
      t.references :poster
      t.timestamps
    end
    add_foreign_key :relations, :users, column: :subscriber_id
    add_foreign_key :relations, :users, column: :poster_id
    add_index :relations, [:subscriber_id, :poster_id], unique: true
  end
end
