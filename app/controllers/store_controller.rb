class StoreController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:index, :show]

  include CurrentCart
  before_action :set_cart

  def index
	@products = Product.order(:title)
  end
end
