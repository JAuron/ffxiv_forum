class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def index?
    admin?
  end

  def create?
  	true
  end

  def update?
    @user == @record or admin?
  end

  def update_password?
  	@user == @record
  end

  def update_roles?
    admin?
  end

end
