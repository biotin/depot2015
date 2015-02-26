class Ability
  include CanCan::Ability

  def initialize(admin_user)

    admin_user ||= AdminUser.new


    if admin_user.role == "productmanager"
      can :manage, Product
      can :read, ActiveAdmin::Page, :name => "Dashboard"

    elseif admin_user.role == "ordermanager"
      can :manage, Order
      can :read, ActiveAdmin::Page, :name => "Dashboard"

    elseif admin_user.role == 'administrator'
      can :manage, :all
      can :read, ActiveAdmin::Page, :name => "Dashboard"

    else
      can :read, Product
    end
    
 end
end
