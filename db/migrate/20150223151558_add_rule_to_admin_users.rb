class AddRuleToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :role, :string
  end
end
