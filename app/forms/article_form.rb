class ArticleForm < Article
  include ActiveFormModel

  permit :body, :title, :article_category_id

  validates :article_category_id, presence: true
  validate :valid_new_category?, :can_category_update?, if: -> { article_category_id.present? }

  def valid_new_category?
    if new_category.nil? 
      errors.add(:invalid_category, "category not exist")
    end
  end

  def can_category_update?
    if self.archived? && new_category != prev_category
      errors.add(:archived_article, 'Can not change category, because article is archived')
    end
  end

  private

  def new_category
    @category ||= Article::Category.find_by(id: article_category_id)
  end

  def prev_category
    @prev_category ||= Article.find(id).category
  end
end
