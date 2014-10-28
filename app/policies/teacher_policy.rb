class TeacherPolicy < ApplicationPolicy
	attr_reader :user, :teacher

  def initialize(user, teacher)
    @user = user
    @teacher = teacher
  end

  def show?
    teacher.visible || user
  end

  def update?
    user || teacher.id == user.id
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :teacher, :scope

    def initialize(teacher, scope)
      @teacher  = teacher
      @scope = scope
    end

    def resolve
      if teacher
        scope
      else
        scope.visible
      end
    end
  end
end