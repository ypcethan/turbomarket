class CartController < ApplicationController
  def update
    line_item = current_user.cart.line_items.find_by(product_id: line_item_params[:product_id])

    if line_item
      if line_item_params[:quantity].to_i.zero?
        line_item.destroy
      else
        line_item.update(quantity: line_item_params[:quantity])
      end
    else
      current_user.cart.line_items << LineItem.new(line_item_params)
    end
  end

  private

  def line_item_params
    params.require(:cart).permit(:product_id, :quantity)
  end
end
