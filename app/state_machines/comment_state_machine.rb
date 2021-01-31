# frozen_string_literal: true

module CommentStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm(:state) do
      state :pending_review, initial: true
      state :finished_review

      event :finish_review do
        transitions from: :pending_review, to: :finished_review
        after do
          touch(:reviewed_at) # rubocop:disable Rails/SkipsModelValidations
        end
      end
    end
  end
end
