# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    commenter { 'MyString' }
    body
    article { nil }
  end
end
