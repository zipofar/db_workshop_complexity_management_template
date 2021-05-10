class AddRatingToComment < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :rating, :integer
  end
end
