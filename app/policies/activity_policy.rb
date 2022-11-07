class ActivityPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def show?
    update?
  end

  def update?
    user.id == record.user_id
  end

  def destroy?
    user.id == record.user_id
  end

  class Scope < Scope
    def resolve
      scope.where(user:)
    end
  end
end
