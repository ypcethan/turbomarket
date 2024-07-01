class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  default_scope { order(created_at: :desc) }

  def line_total
    product.price * quantity
  end
end
