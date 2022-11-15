class AddCourseRefToEnrollments < ActiveRecord::Migration[7.0]
  def change
    add_reference :enrollments, :course, null: false, foreign_key: true
  end
end
