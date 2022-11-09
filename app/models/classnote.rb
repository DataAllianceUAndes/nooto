class Classnote < ApplicationRecord
  # Associations
  has_many :reviews, dependent: :destroy
  belongs_to :user
  belongs_to :course, optional: true
  has_many_attached :files
end
