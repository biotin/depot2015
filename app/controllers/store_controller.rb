class StoreController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
	@products = Product.order(:title)
  end
  
  def show
  end
end
