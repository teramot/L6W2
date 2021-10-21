class CartitemsController < ApplicationController
    def new
        @cartitem = Cartitem.new
        @product = Product.find(params[:id])
        logger.debug "--------------------------------------------------------"
    end
    
    def create
        #@cartitem.product_id = @product.id
        product = Product.find(params[:product_id])
        productId = product.id
        unless product.cart?(current_cart)
            product.cartIn(productId, current_cart, params[:cart_item][:quantity])
        end
        redirect_to root_path
    end
    
    def destroy
        product = Cartitem.find(params[:id])
        if product.cart?(current_cart)
            product.cartOut(current_cart)
        end
        redirect_to root_path
    end
end
