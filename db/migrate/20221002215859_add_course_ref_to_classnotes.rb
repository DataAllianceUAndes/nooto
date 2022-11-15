class AddCourseRefToClassnotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :classnotes, :course, null: false, foreign_key: true
  end
end
