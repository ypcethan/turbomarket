class LineItem < ApplicationRecord
  belings_to :product
  belongs_to :cart
end
