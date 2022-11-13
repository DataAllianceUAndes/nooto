class Favorite < ApplicationRecord
  validates :user, uniqueness: { scope: :classnote }
  belongs_to :user
  belongs_to :classnote
end
