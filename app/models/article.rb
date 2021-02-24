# frozen_string_literal: true

class Article < ApplicationRecord
  include ArticleStateMachine

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy, class_name: 'Article::Rating'
  belongs_to :category, inverse_of: :articles, class_name: 'Article::Category', foreign_key: :article_category_id

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
  validates :article_category_id, presence: true
  validate :valid_category?

  def valid_category?
    return unless current_category.nil?

    errors.add(:category, :not_exist)
  end

  def set_archived_at
    self.archived_at = Time.current
  end

  private

  def current_category
    @current_category ||= Article::Category.find_by(id: article_category_id)
  end
end
