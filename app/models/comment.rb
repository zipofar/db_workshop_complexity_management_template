# frozen_string_literal: true

class Comment < ApplicationRecord
  include CommentStateMachine
  extend Enumerize

  enumerize :rating, in: [:positive, :neutral, :negative]

  belongs_to :article

  validates :body, presence: true
end
