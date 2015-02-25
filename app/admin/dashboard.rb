ActiveAdmin.register_page "Dashboard" do

  menu priority: 1
  content :title => proc{ I18n.t("active_admin.dashboard") } do
   I18n.t("active_admin.dashboard_welcome")

#columns do
#
#  column do

#        panel I18n.t('orderinfo')  do
#          table_for Product.order('id desc').limit(10) do
#            column I18n.t('ordername')   {|order| link_to(order.title, admin_product_path(order))  }
#            column I18n.t('orderprice')   {|order| number_to_currency link_to( order.price, admin_product_path(order))  }
#          end
#        end
#
#       panel "Recent Orders" do
#         table_for Order.order('id desc').limit(10) do
#            column I18n.t('username')   {|order| link_to(order.name, admin_order_path(order))  }
#            column I18n.t('totalpr')  {|order| number_to_currency link_to(order.line_items.to_a.sum { |item| item.total_price }, admin_order_path(order))  }
#          end
#        end

#    end
#  end
  end
end
