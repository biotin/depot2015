class StoreController < ApplicationController
  before_filter :authenticate_admin_user!, except: [:index, :show]

  include CurrentCart
  before_action :set_cart

  def index
      if params[:set_locale]
        redirect_to store_url(locale: params[:set_locale])
      else
	       @products = Product.order(:title).paginate(page: params[:page], per_page: 1)
      end
  end
end
