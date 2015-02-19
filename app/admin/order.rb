ActiveAdmin.register Order do


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

  index do
   column :id
   column :name
   column :address
   column :email
   column :pay_type
  
#    test =  LineItem.find_by(id: 7)
#    column :product do
#     number = test.product_id 
#     f = Product.find_by(id: number)
#     f.title
#    end

   # column :quantity do 
   #  test.quantity
   # end
   
   #test =  LineItem.where(order_id: 5) 
   #name  = Product.find_by(id: test.product_id )
   #name.title
    
   column :created_at
   actions
  end

end
