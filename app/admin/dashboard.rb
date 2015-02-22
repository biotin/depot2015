ActiveAdmin.register_page "Dashboard" do

  menu priority: 1
  content :title => proc{ I18n.t("active_admin.dashboard") } do

  columns do

   column do

        panel "Recent Products" do
          table_for Product.order('id desc').limit(10) do
          #  column("State")   {|order| status_tag(order.state)                                    }
          #  column("Products"){|order|link_to product.title, admin_product_path(product)}
            column("Products")   {|order| link_to(order.title, admin_product_path(order))  }
            column("Products")   {|order| number_to_currency link_to( order.price, admin_product_path(order))  }
          end
        end

        panel "Recent Orders" do
          table_for Order.order('id desc').limit(10) do
          #  column("State")   {|order| status_tag(order.state)                                    }
          #  column("Products"){|order|link_to product.title, admin_product_path(product)}
            column("Name")   {|order| link_to(order.name, admin_product_path(order))  }
            column("Total")   {|order| number_to_currency link_to(order.line_items.to_a.sum { |item| item.total_price }, admin_product_path(order))  }
          end
        end
    end
  end
  #content title: proc{ I18n.t("active_admin.dashboard") } do
  #  div class: "blank_slate_container", id: "dashboard_default_message" do
  #  span class: "blank_slate" do
  #    span I18n.t("active_admin.dashboard_welcome.welcome")
  #      small I18n.t("active_admin.dashboard_welcome.call_to_action")
  #    end
  #  end

    # Here is an example of a simple dashboard with columns and panels.
    #
     #columns do
      # column do
      #   panel "Recent Products" do
      #     ul do
      #      Product.recent(5).map do |product|
      #         li link_to(product.title, admin_product_path(product))
      #       end
      #     end
      #   end
      # end
    #end
    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
    # content
  end
end
