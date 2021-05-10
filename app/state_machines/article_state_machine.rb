# frozen_string_literal: true

module ArticleStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm(:state) do
      state :draft, initial: true
      state :published
      state :archived, before_enter: :set_archived_at

      event :publish do
        transitions from: :draft, to: :published
      end

      event :archive do
        transitions from: [:draft, :published], to: :archived
      end
    end
  end
end
