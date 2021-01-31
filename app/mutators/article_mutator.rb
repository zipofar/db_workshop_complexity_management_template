class ArticleMutator < ApplicationMutator
  def update(params, new_category)
    if record.archived? && new_category != record.article_category
      merge_errors({ archived_article: 'Can not change category, because article is archived' })

      return false
    end

    record.update(params.merge({ article_category_id: new_category.id }))
  end
end
