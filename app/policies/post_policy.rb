class PostPolicy < ApplicationPolicy
  attr_reader :user, :record

  def create?
    red_wing?
  end

  def update?
    record.user == user or admin?
  end

  def destroy?
    record.user == user or admin?
  end
end
