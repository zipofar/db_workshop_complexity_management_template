# frozen_string_literal: true

class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :category

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
