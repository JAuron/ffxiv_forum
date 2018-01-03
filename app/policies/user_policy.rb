class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    admin?
  end

  def create
  	true
  end

end
