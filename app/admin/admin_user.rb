ActiveAdmin.register AdminUser do

  permit_params :email, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :email
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    #  f.collection_select :role, AdminUser::ROLES, :to_s, :humanize
      f.input :role, as: :radio, collection: AdminUser::ROLES # {productmanager: "Productmanager", ordermanager: "Ordermanager", administrator: "Administrator"}
    end
    f.actions
  end

end
