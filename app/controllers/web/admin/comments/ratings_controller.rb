# frozen_string_literal: true

class  Web::Admin::Comments::RatingsController <  Web::Admin::Comments::ApplicationController
  def update
    comment.finish_review

    if comment.update(rating_params)
      redirect_to web_admin_comments_path
    else
      render :index
    end
  end

  private

  def rating_params
    params.require(:comment).permit(:rating)
  end
end
