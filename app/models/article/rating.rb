# frozen_string_literal: true

class Article::Rating < ApplicationRecord
  belongs_to :article, inverse_of: :ratings, class_name: 'Article'

  validates :sum_of_ratings, presence: true
  validates :rating, presence: true
  validates :is_current_rating, inclusion: { in: [true, false] }

  def human_rating
    return 'negative' if rating.negative?
    return 'positive' if rating.positive?

    'neutral'
  end
end
