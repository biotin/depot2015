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
  actions  :index, :show, :edit, :destroy

  index do
   column :id
   column :name
   column :address
   column :email
   column :pay_type
   column :created_at
   actions
  end

  show do

    panel "Order Information" do
       table_for(order.line_items) do |t|
         t.column("Product") {|item| auto_link item.product }
         t.column("Quantity")   {|item|  item.quantity }
         t.column("Price")   {|item| number_to_currency item.product.price * item.quantity }
       end
     end

     panel "User Information" do
       table_for(order) do |t|
         column "Name", :name
         column "Address", :address
         column "Email", :email
         column "Pay Type", :pay_type
         column "Created:",  :created_at
       end
     end
  end

  sidebar "Total price",:only => :show  do
#    Order.name
    number_to_currency order.line_items.to_a.sum { |item| item.total_price }
  end
end
