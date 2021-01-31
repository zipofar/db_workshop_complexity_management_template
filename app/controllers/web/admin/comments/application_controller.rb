# frozen_string_literal: true

class Web::Admin::Comments::ApplicationController < Web::Admin::ApplicationController
  def comment
    @comment ||= Comment.find(params[:comment_id])
  end
end
