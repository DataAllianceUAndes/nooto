class Course < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :enrollments
  has_many :users, through: :enrollment
end
