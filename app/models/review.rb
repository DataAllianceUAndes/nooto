class Review < ApplicationRecord
    belongs_to :classnote
    belongs_to :user
end
