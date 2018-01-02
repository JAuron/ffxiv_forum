class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def admin?
    return false unless @user
    @user.has_role?('admin')
  end

  def red_wing?
    return false unless @user
    @user.has_role?('red_wing')
  end

  def index?
    red_wing?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    admin?
  end

  def new?
    create?
  end

  def update?
    admin?
  end

  def edit?
    update?
  end

  def destroy?
    admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
