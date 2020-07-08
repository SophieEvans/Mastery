class VideoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def dashboard?
    true
  end

  def search?
    scope.all
  end
end
