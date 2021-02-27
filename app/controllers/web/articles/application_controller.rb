# frozen_string_literal: true

class Web::Articles::ApplicationController < Web::ApplicationController
  before_action :authenticate_user!

  def current_article
    @current_article ||= Article.published.find(params[:article_id])
  end
end
