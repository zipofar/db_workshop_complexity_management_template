# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title
    body
    category { nil }
  end
end
