# frozen_string_literal: true

class  Web::Admin::Comments::RatingsController <  Web::Admin::Comments::ApplicationController
  def update
    comment_rating_form = comment.becomes(Comment::RatingForm)

    if comment_rating_form.update(rating_params)
      comment.finish_review!
      redirect_to admin_comments_path
    else
      error = comment_rating_form.errors.messages[:rating]
      redirect_to admin_comments_path, flash: { error: "Rating #{error.first}" }
    end
  end

  private

  def rating_params
    params.require(:comment).permit(:rating)
  end
end
