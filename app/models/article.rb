# frozen_string_literal: true

class Article < ApplicationRecord
  include ArticleStateMachine

  has_many :comments, dependent: :destroy
  belongs_to :article_category, class_name: '::Article::Category'

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
