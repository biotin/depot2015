class Ability
  include CanCan::Ability

  def initialize(admin_user)

    if admin_user.role == "productmanager"
      can :manage, Product
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end

    if admin_user.role == "ordermanager"
      can :manage, Order
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end

   can :manage, :all if admin_user.role == "administrator"
  end
end
