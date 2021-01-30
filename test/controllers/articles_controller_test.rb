# frozen_string_literal: true

require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get articles_path
    assert_response :success
  end

  test '#show' do
    article = articles(:one)
    get article_path(article)
    assert_response :success
  end

  test '#new' do
    get new_article_path
    assert_response :success
  end

  test '#create' do
    attrs = FactoryBot.attributes_for(:article, category_id: Category.first.id)

    post articles_path, params: { article: attrs }
    assert_response :redirect

    article = Article.find_by(title: attrs[:title])
    assert { article }
  end

  test '#edit' do
    article = articles(:one)
    get edit_article_path(article)
    assert_response :success
  end

  test '#update' do
    article = articles(:one)

    attrs = FactoryBot.attributes_for :article

    patch article_path(article), params: { article: attrs }
    assert_response :redirect

    article.reload
    assert { article.title == attrs[:title] }
  end
end
