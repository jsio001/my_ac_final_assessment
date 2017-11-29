class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :note, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :likes, [:note_id, :user_id], unique: true
  end
end
