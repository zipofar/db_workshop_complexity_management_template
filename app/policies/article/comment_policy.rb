# frozen_string_literal: true

class Article::CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    author?
  end
end
