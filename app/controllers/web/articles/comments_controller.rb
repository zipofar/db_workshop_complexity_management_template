# frozen_string_literal: true

class Web::Articles::CommentsController < Web::Articles::ApplicationController
  def create
    comment = current_article.comments.new(comment_params)

    unless comment.save
      flash[:error] = comment.errors.full_messages
    end

    redirect_to article_path(current_article)
  end

  def destroy
    comment = current_article.comments.find(params[:id])
    comment.destroy

    redirect_to article_path(current_article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
