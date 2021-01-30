# frozen_string_literal: true

module ArticleStateMachine
  extend ActiveSupport::Concern

  included do
    include AASM

    aasm(:state, column: :state) do
      state :published
      state :archived

      event :publish do
        transitions to: :published
      end

      event :archive do
        transitions to: :archived
        after do
          touch(:archived_at) # rubocop:disable Rails/SkipsModelValidations
        end
      end
    end
  end
end
