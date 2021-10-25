class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(name: params[:product][:name],
                              price: params[:product][:price])
        
        if @product.save
            flash[:notice] = '商品を新しく登録しました'
            redirect_to root_path
        else
            render '/products/new'
        end
    end
    
    def destroy
        product = Product.find(params[:id])
        product.destroy
        flash[:notice] = '商品を削除しました'
        redirect_to root_path
    end
end
