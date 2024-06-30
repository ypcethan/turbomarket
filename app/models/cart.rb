class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items

  def quantity_for(product)
    line_items.find_by(product: product)&.quantity || 0
  end
end
