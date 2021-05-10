# frozen_string_literal: true

class ArticleForm < Article
  include ActiveFormModel

  permit :body, :title, :article_category_id
end
