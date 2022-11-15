class AddUserRefToClassnotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :classnotes, :user, null: false, foreign_key: true
  end
end
