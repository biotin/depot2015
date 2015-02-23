class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w(administrator productmanager ordermanager)

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
