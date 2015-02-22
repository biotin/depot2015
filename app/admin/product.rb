ActiveAdmin.register Product do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  permit_params :title, :description, :price, :image_url

  #def permitted_params
  #  params.permit(:product => [:title, :description, :price, :image_url])
  #end

  index do
    column :id
    column :title do |product|
     link_to product.title, admin_product_path(product)
    end
    column :description do |product|
     truncate(product.description, :length => 300)
    end
    column :image_url do |product|
     image_tag(product.image_url, size: "50x50")
    end
    column :price do |product|
     number_to_currency product.price
    end
    column :created_at
    column :updated_at
   actions
  end
end
