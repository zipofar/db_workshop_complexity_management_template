# frozen_string_literal: true

class Web::Admin::Comments::ApplicationController < Web::Admin::ApplicationController
  def current_comment
    @current_comment ||= Comment.find(params[:comment_id])
  end

  def current_article
    @current_article = current_comment.article
  end
end
