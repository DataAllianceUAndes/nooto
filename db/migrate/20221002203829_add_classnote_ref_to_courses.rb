class AddClassnoteRefToCourses < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :classnote, null: false, foreign_key: true
  end
end
