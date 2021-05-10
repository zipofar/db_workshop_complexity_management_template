class CreateArticleRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :article_ratings do |t|
      t.integer :sum_of_ratings
      t.boolean :is_current_rating
      t.decimal :rating, :precision => 3, :scale => 2
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
