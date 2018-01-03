class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    true
  end
end
