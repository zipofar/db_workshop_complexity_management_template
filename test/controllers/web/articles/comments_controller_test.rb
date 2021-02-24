# frozen_string_literal: true

require 'test_helper'

class Web::Articles::CommentsControllerTest < ActionDispatch::IntegrationTest
  test '#create' do
    article = articles(:one)
    attrs = FactoryBot.attributes_for(:comment)

    post article_comments_path(article), params: { comment: attrs }
    assert_response :redirect

    comment = Comment.find_by(body: attrs[:body])
    assert { comment }
  end

  test '#destroy' do
    comment = comments(:one)

    delete article_comment_path(comment.article, comment)
    assert_response :redirect

    comment = Comment.find_by(id: comment.id)
    assert { comment.nil? }
  end
end
