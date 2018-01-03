class ClassLookupPolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    admin?
  end
end
