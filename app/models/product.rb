class Product < ApplicationRecord
    has_one :cartitem
    has_one :cartitem_cart, through: :cart_item, source: :cart
    
    def cartIn(quantity, cart)
        cartitems.create(product_id: product_id, cart_id: cart.id, quantity: quantity)
    end
    
    def cartOut(cart)
        cartitems.find_by(cart_id: cart.id).destroy
    end
    
    def cart?(cart)
        cartitem_cart.include?(cart)
        #cartitem_carts.include?(cart)
    end
end
