class AddUserIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :user_id, :integer
  end
end
