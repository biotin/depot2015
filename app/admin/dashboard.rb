ActiveAdmin.register_page "Dashboard" do

  menu priority: 1
  content :title => proc{ I18n.t("active_admin.dashboard") } do

  columns do

   column do

        panel "Recent Products" do
          table_for Product.order('id desc').limit(10) do
            column("Products")   {|order| link_to(order.title, admin_product_path(order))  }
            column("Products")   {|order| number_to_currency link_to( order.price, admin_product_path(order))  }
          end
        end

        panel "Recent Orders" do
          table_for Order.order('id desc').limit(10) do
            column("Name")   {|order| link_to(order.name, admin_order_path(order))  }
            column("Total")   {|order| number_to_currency link_to(order.line_items.to_a.sum { |item| item.total_price }, admin_order_path(order))  }
          end
        end
    end
  end
  end
end
