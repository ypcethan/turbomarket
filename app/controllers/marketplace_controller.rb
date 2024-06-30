class MarketplaceController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
    @cart = current_user.cart || Cart.create(user: current_user)
  end
end
