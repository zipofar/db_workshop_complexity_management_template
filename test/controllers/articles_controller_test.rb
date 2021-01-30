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
    article_category = article_categories(:one)
    attrs = FactoryBot.attributes_for(:article, article_category_id: article_category.id)

    post articles_path, params: { article: attrs }
    assert_response :redirect

    article = Article.find_by(title: attrs[:title])
    assert { article }
    assert { article.draft? }
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

  test '#publish' do
    article = articles(:one)

    patch publish_article_path(article)
    assert_response :redirect

    article.reload
    assert { article.published? }
  end

  test '#archive' do
    article = articles(:one)

    patch archive_article_path(article)
    assert_response :redirect

    article.reload
    assert { article.archived? }
    assert { article.archived_at }
  end
end
