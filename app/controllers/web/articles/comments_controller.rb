# frozen_string_literal: true

class Web::Articles::CommentsController < Web::Articles::ApplicationController
  def create
    @comment = current_article.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(current_article)
    else
      render 'web/comments/new', locals: { article: current_article }
    end
  end

  def destroy
    comment = current_article.comments.find(params[:id])

    authorize([:article, comment])

    comment.destroy

    redirect_to article_path(current_article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
