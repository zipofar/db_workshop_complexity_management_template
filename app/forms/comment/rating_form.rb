class Comment::RatingForm < Comment
  include ActiveFormModel

  permit :rating

  validates :rating, presence: true
end
