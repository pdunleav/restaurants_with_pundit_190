class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # everyone can see all restaurants
      scope.all

      # You can only see restaurants you own
      # scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # If user created the restaurant => true
  #   # otherwise false

  #   # 1. user => current user
  #   # 2. record => @restaurant
  #   user == record.user
  # end

  def update?
    user_is_owner? || user_is_admin?
  end

  def destroy?
    user_is_owner? || user_is_admin?
  end

  private

  def user_is_owner?
    user == record.user
  end

  def user_is_admin?
    user.admin
  end
end








