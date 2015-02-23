ActiveAdmin.register Order do

  actions  :index, :show, :edit, :destroy

  index do
   column :id
   column :name do |order|
     link_to order.name, admin_order_path(order)
   end
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

  sidebar "Total price", :only => :show  do
     number_to_currency order.line_items.to_a.sum { |item| item.total_price }
  end

  sidebar "Export" do # , :only => :show  do
    link_to 'Export order to PDF', 'javascript:if(window.print)window.print()'
  end
end
