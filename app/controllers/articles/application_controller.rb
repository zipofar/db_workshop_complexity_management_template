# frozen_string_literal: true

class Articles::ApplicationController < ApplicationController
  def article
    @article ||= Article.published.find(params[:article_id])
  end
end
