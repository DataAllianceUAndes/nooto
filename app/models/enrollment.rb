class Enrollment < ApplicationRecord
  # Associations
  belongs_to :course
  belongs_to :user
end
