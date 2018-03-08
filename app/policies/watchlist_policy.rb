class WatchlistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


  def create?
    record.user == user
  end

  def destroy
    true
  end
end
