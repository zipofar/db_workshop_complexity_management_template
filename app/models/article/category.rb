# frozen_string_literal: true

class Article::Category < ApplicationRecord
  has_many :articles, inverse_of: :category, foreign_key: :article_category_id, class_name: 'Article', dependent: :destroy

  validates :name, presence: true
end
