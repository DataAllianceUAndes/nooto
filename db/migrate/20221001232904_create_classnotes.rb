class CreateClassnotes < ActiveRecord::Migration[7.0]
  def change
    create_table :classnotes do |t|
      t.string :title

      t.timestamps
    end
  end
end
