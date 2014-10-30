class UserPolicy 
	attr_reader :user

  def initialize(user)
    @user = user
  end

  def update?
    user.admin?
  end

  def show?
    user
  end

  def update?
    user
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, user.type)
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