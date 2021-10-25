class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 0}
    
    has_one :cartitem
    #belongs_to :cart
    has_one :cartitem_cart, through: :cartitem, source: :cart
   
    #def cartIn(quantity, cart)
    #    cartitems.create(product_id: product_id, cart_id: cart.id, quantity: quantity)
    #end
    
    #def cartOut(cart)
    #    cartitems.find_by(cart_id: cart.id).destroy
    #end
    
    #def cart?(cart)
    #    cartitem_cart.include?(cart)
        #cartitem_carts.include?(cart)
    #end
end
