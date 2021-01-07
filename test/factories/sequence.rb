# frozen_string_literal: true

FactoryBot.define do
  sequence :title do
    Faker::Lorem.word
  end

  sequence :body do
    Faker::Lorem.paragraph_by_chars(number: 20)
  end
end
