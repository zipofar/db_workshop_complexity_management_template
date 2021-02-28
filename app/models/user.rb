# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enumerize :role, in: [:user, :admin], default: :user, predicates: true

  has_many :comments, dependent: :destroy
  has_many :articles, dependent: :destroy
end
