class TeacherPolicy < ApplicationPolicy
	attr_reader :user

  def initialize(user)
    @user = user
  end

  def update?
    user.admin?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user
        scope
      else
        scope.visible
      end
    end
  end
end