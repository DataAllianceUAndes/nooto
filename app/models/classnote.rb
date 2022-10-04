class Classnote < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :course, optional: true
  has_many_attached :files
end
