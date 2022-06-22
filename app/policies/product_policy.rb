class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def create?
      user.is_seller?
    end
  
    # def edit?
    #   user.is_travel_agent?
    # end
  
    # def update?
    #   user.is_travel_agent?
    # end
  
    # def destroy?
    #   user.is_travel_agent?
    # end
  end
end
