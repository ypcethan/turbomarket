class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    products = if params[:name] 
                  Product.where("name ILIKE ?", "%#{params[:name]}%")
                else
                  Product.all
                end
    @pagy, @products = pagy(products, items: 10)
    @cart = current_user.cart || Cart.create(user: current_user)
  end
end
