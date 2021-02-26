# frozen_string_literal: true

class Web::Admin::Comments::RatingsController < Web::Admin::Comments::ApplicationController
  def update
    comment_rating_form = current_comment.becomes(Comment::RatingForm)
    @comment = Comment::RatingMutator.update(comment_rating_form, rating_params)

    if @comment.valid?
      redirect_to admin_comments_path
    else
      render :edit
    end

  end

  private

  def rating_params
    params.require(:comment)
  end
end
