# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  def update?
    author?
  end

  def destroy?
    author?
  end
end
