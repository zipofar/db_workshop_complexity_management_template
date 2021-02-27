class AddUserToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, foreign_key: true, index: true
    remove_column :comments, :commenter
  end
end
