class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def destroy?
    record.user == user
  end

  def no_display?
    return true
  end

  def add_ticket?
    return true
  end

end
