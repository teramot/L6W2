class Cartitem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  
  def sum_of_price
    product.price * quantity
  end
end
