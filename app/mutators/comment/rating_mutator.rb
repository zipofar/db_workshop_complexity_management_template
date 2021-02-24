# frozen_string_literal: true

module Comment::RatingMutator
  def self.update(comment, params)
    if comment.update(params)
      comment.finish_review!
      Article::RatingService.create_rating!(comment)
    end

    comment
  end
end
