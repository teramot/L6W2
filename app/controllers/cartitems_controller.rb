class CartitemsController < ApplicationController
    def new
        @cartitem = Cartitem.new
        @product = Product.find(params[:id])
    end
    
    def create
=begin
        product = Product.find(params[:product_id])
        productId = product.id
        unless product.cart?(current_cart)
            product.cartIn(productId, current_cart, params[:cart_item][:quantity])
        end
        redirect_to root_path
=end
        @cartitem ||= current_cart.cartitems.build(product_id: params[:cartitem][:product_id])
        @cartitem.quantity = params[:cartitem][:quantity].to_i
        if @cartitem.save
            flash[:notice] = '商品をカートに追加しました'
            redirect_to '/carts/show'
        else
            redirect_to new_cart_item_path(id: params[:cartitem][:product_id])
        end
    end
    
    def destroy
=begin
        product = Cartitem.find(params[:id])
        if product.cart?(current_cart)
            product.cartOut(current_cart)
        end
        redirect_to root_path
=end
        if @cartitem.destroy
            flash[:notice] = '商品をカートから削除しました'
        else
            flash[:alert] = '削除に失敗しました'
        end
        redirect_to '/carts/show'
    end
    
    private
    
    def setup_cart_item!
        @cartitem = current_cart.cartitems.find_by(product_id: params[:product_id])
    end
end
