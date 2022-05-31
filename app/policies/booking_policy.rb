class BookingPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end

  def create?
    true
  end

  def update?
    record.venue.user == user
  end

  def destroy?
    record.user == user || record.venue.user == user
  end
end
