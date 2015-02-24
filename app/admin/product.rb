ActiveAdmin.register Product do

permit_params :title, :description, :price, :image_url, :locale

  index do
    column :id
    column :locale
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

  form do |f|
    f.inputs "Product Details" do
      f.input :title
      f.input :locale, as: :radio, collection: LANGUAGES
      f.input :description
      f.input :image_url
      f.input :price
      f.input  :created_at
    end
    f.actions
  end
end
