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

    if admin_user.role == 'administrator'
      can :manage, :all
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end
 end
end
