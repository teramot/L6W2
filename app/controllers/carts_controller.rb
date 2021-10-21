class CartsController < ApplicationController
    def show
        @cartitems = Cartitem.all
    end
end
