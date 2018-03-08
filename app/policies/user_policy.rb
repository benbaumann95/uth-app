class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def edit_first_name?
    true
  end


  def edit_last_name?
    true
  end

  def edit_email?
    true
  end

  def edit_bio?
    true
  end

  def edit_profile_pic?
    true
  end

  def profile?
    true
  end
end
