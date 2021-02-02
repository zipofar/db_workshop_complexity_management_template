# frozen_string_literal: true

class Articles::CommentsController < Articles::ApplicationController
  def create
    comment = article.comments.new(comment_params)

    if comment.save
      redirect_to article_path(article)
    else
      key, values = comment.errors.messages.first
      redirect_to article_path(article), flash: { error: "Comment #{key} #{values.first}" }
    end
  end

  def destroy
    article.comments.find(params[:id]).destroy

    redirect_to article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
