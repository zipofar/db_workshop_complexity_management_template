class AddArchivedAtToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :archived_at, :datetime
  end
end
