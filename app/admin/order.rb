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
    panel  I18n.t('orderinfo') do #t('.productinfo') do #
       table_for(order.line_items) do |t|
         t.column(I18n.t('ordername')) {|item| auto_link item.product }
         t.column(I18n.t('orderquantity'))   {|item|  item.quantity }
         t.column(I18n.t('orderprice'))   {|item| number_to_currency item.product.price * item.quantity }
       end
     end

     panel  I18n.t('userinfo')do
       table_for(order) do |t|
         column I18n.t('username'), :name
         column  I18n.t('useradress'), :address
         column  I18n.t('useremail'), :email
         column  I18n.t('userpaytp'), :pay_type
         column  I18n.t('usercreatdt'),  :created_at
       end
     end
  end

  sidebar  I18n.t('totalpr'), :only => :show  do
     number_to_currency order.line_items.to_a.sum { |item| item.total_price }
  end

  sidebar  I18n.t('exprtpdf') do # , :only => :show  do
    link_to I18n.t('exportpdflink'), 'javascript:if(window.print)window.print()'
  end
end
