# frozen_string_literal: true

class Article::Category < ApplicationRecord
  has_many :articles, dependent: :destroy, foreign_key: :article_category

  validates :name, presence: true
end
