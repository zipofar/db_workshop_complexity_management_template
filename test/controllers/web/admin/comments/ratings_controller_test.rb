# frozen_string_literal: true

require 'test_helper'

class Web::Admin::Comments::RatingsControllerTest < ActionDispatch::IntegrationTest
  test '#update' do
  comment = comments(:one)

  attrs = { rating: Comment.rating.values.first }

  patch web_admin_comment_rating_path(comment), params: { comment: attrs }
  assert_response :redirect

  comment.reload
  assert { comment.finished_review? }
  assert { comment.rating == attrs[:rating] }
  end
end
