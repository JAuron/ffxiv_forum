class TopicPolicy < ApplicationPolicy
  attr_reader :user, :record

  def create?
  	red_wing?
  end

end
