class AddProductLocale < ActiveRecord::Migration
  def change
    add_column :products, :locale, :string
  end
end
