class CartsController < ApplicationController
    def show
        @cartitems = current_cart.cartitems.includes([:product])
        @total = @cartitems.inject(0) { |sum, item| sum + item.sum_of_price }
    end
end
