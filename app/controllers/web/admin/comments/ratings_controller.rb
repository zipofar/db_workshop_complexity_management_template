# frozen_string_literal: true

class Web::Admin::Comments::RatingsController < Web::Admin::Comments::ApplicationController
  def update
    comment_rating_form = current_comment.becomes(Comment::RatingForm)
    comment = Comment::RatingMutator.update(comment_rating_form, rating_params)

    unless comment.valid?
      flash[:error] = comment.errors.full_messages
    end

    redirect_to admin_comments_path
  end

  private

  def rating_params
    params.require(:comment)
  end
end
