class AddReviewStateToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :state, :string
    add_column :comments, :reviewed_at, :datetime
  end
end
