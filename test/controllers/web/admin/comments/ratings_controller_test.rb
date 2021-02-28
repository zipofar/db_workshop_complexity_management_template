# frozen_string_literal: true

require 'test_helper'

class Web::Admin::Comments::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in(@user)
  end

  test '#update when article has not rating' do
    comment = comments(:one)
    article = comment.article

    attrs = { rating: :neutral }

    patch admin_comment_rating_path(comment), params: { comment: attrs }
    assert_response :redirect

    comment.reload
    assert { comment.finished_review? }
    assert { comment.rating == attrs[:rating] }
    assert { article.ratings.count == 1 }
  end

  test '#update when article has rating' do
    comment = comments(:one_one_user_one_article_published)

    article = comment.article

    attrs = { rating: :neutral }

    patch admin_comment_rating_path(comment), params: { comment: attrs }
    assert_response :redirect

    comment.reload
    assert { comment.finished_review? }
    assert { comment.rating == attrs[:rating] }
    assert { article.ratings.count == 2 }
    assert { article.ratings.first.is_current_rating == false }
  end

  test '#update with empty rating' do
    comment = comments(:one)

    attrs = { rating: '' }

    patch admin_comment_rating_path(comment), params: { comment: attrs }
    assert_response :success

    comment.reload
    assert { comment.pending_review? }
    assert { comment.rating.nil? }
  end
end
