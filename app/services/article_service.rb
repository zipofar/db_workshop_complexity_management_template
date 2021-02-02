class ArticleService
  class << self
    def article_ratings(articles)
      articles.includes(:comments).map { |article| article_rating(article.comments) }
    end

    def article_rating(comments)
      return nil if comments.empty?

      mapRatingToNumber = { positive: 1, neutral: 0, negative: -1 }.stringify_keys
      comments.pluck(:rating).map { |rating| mapRatingToNumber[rating] }.compact.sum
    end
  end
end
