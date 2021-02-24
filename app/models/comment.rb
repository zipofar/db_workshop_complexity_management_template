# frozen_string_literal: true

class Comment < ApplicationRecord
  include CommentStateMachine
  extend Enumerize

  enumerize :rating, in: { positive: 1, neutral: 0, negative: -1 }

  belongs_to :article

  validates :body, presence: true
end
