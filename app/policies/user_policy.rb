class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Anyone can view any article
      scope.all
    end
  end
end
