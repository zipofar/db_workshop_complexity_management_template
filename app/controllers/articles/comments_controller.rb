# frozen_string_literal: true

class Articles::CommentsController < Articles::ApplicationController
  def create
    @comment = article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
