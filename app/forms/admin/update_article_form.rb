# frozen_string_literal: true

class Admin::UpdateArticleForm < Article
  include ActiveFormModel

  permit :body, :title, :article_category_id

  validate :valid_state_article?, if: :article_category_id_changed?

  def valid_state_article?
    return unless archived?

    errors.add(:category, :article_archived)
  end
end
