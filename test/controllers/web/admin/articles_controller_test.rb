# frozen_string_literal: true

require 'test_helper'

class Web::Admin::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test '#index' do
    get web_admin_articles_path
    assert_response :success
  end

  test '#show' do
    article = articles(:one)
    get web_admin_article_path(article)
    assert_response :success
  end

  test '#edit' do
    article = articles(:one)
    get edit_web_admin_article_path(article)
    assert_response :success
  end

  test '#update' do
    article = articles(:one)
    article_category = article_categories(:one)

    attrs = FactoryBot.attributes_for(:article, article_category_id: article_category.id)

    patch web_admin_article_path(article), params: { article: attrs }
    assert_response :redirect

    article.reload
    assert { article.title == attrs[:title] }
  end

  test '#publish' do
    article = articles(:draft)

    patch publish_web_admin_article_path(article)
    assert_response :redirect

    article.reload
    assert { article.published? }
  end

  test '#archive' do
    article = articles(:one)

    patch archive_web_admin_article_path(article)
    assert_response :redirect

    article.reload
    assert { article.archived? }
    assert { article.archived_at }
  end
end
