class AddClassnoteRefToReviews < ActiveRecord::Migration[7.0]
  def change
    add_reference :reviews, :classnote, null: false, foreign_key: true
  end
end
