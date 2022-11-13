class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :classnote, null: false, foreign_key: true

      t.timestamps
    end
    add_index :favorites, [:user_id, :classnote_id], unique: true
  end
end
