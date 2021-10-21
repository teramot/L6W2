class Cart < ApplicationRecord
    has_many :cartitems
    has_many :cartitem_products, through: :cart_items, source: :product
end
