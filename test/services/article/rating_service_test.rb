# frozen_string_literal: true

require 'test_helper'

class Article::RatingsServiceTest < ActiveSupport::TestCase
  test '#create when article has not rating' do
    comment = comments(:one_with_positive_rating)
    article = comment.article

    Article::RatingService.create_rating!(comment)

    assert { article.ratings.count == 1 }

    current_article_rating = article.ratings.first
    assert { current_article_rating.is_current_rating == true }
    assert { current_article_rating.rating == 1 }
    assert { current_article_rating.sum_of_ratings == 1 }
  end

  test '#create when article has rating' do
    comment_one = comments(:one_with_positive_rating)
    comment_two = comments(:two_with_positive_rating)
    article = comment_one.article

    Article::RatingService.create_rating!(comment_one)
    Article::RatingService.create_rating!(comment_two)

    assert { article.ratings.count == 2 }

    previous_article_rating = article.ratings.first
    current_article_rating = article.ratings.last
    assert { previous_article_rating.is_current_rating == false }
    assert { current_article_rating.is_current_rating == true }
    assert { current_article_rating.rating == 1 }
    assert { current_article_rating.sum_of_ratings == 2 }
  end
end
