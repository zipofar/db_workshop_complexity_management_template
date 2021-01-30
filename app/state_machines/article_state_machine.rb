# frozen_string_literal: true

module ArticleStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm(:state) do
      state :draft, initial: true
      state :published
      state :archived

      event :publish do
        transitions from: :draft, to: :published
      end

      event :archive do
        transitions from: [:draft, :published], to: :archived
        after do
          touch(:archived_at) # rubocop:disable Rails/SkipsModelValidations
        end
      end
    end
  end
end
