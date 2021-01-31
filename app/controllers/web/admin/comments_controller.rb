# frozen_string_literal: true

class  Web::Admin::CommentsController <  Web::Admin::ApplicationController
  def index
    @comments = Comment.pending_review
  end
end
