# frozen_string_literal: true

class Article < ApplicationRecord
  include ArticleStateMachine

  has_many :comments, dependent: :destroy
  belongs_to :category, inverse_of: :articles, class_name: 'Article::Category', foreign_key: :article_category_id

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
