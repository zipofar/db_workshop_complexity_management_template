# frozen_string_literal: true

module Article::RatingService
  class << self
    def create_rating!(comment)
      current_rating = comment.article.ratings.order(created_at: :desc).find_by(is_current_rating: true)

      if current_rating.nil?
        comment.article.ratings.create!(sum_of_ratings: comment.rating.value, is_current_rating: true, rating: comment.rating.value)
      else
        sum_of_ratings = comment.rating.value + current_rating.sum_of_ratings
        comments_count = comment.article.comments.where(state: :finished_review).count
        rating = BigDecimal(sum_of_ratings) / BigDecimal(comments_count)

        comment.article.ratings.create!(sum_of_ratings: sum_of_ratings, is_current_rating: true, rating: rating)

        current_rating.update!(is_current_rating: false)
      end
    end
  end
end
