class Cart < ApplicationRecord
    has_many :cartitems, dependent: :destroy
    has_many :cartitem_products, through: :cartitems, source: :product
end
