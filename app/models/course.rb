class Course < ApplicationRecord
  # Associations
  belongs_to :user, optional: true
  has_many :enrollments
  has_many :users, through: :enrollments

end
