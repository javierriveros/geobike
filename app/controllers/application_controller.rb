class ApplicationController < ActionController::Base
  before_action :set_shopping_cart

  private
    def set_shopping_cart
      if cookies[:shopping_cart_id].blank?
        @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
        cookies[:shopping_cart_id] = @shopping_cart.id
      else
        @shopping_cart = ShoppingCart.find(cookies[:shopping_cart_id])
      end

      rescue ActiveRecord::RecordNotFound => e
        @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)

        cookies[:shopping_cart_id] = @shopping_cart.id
    end  
end
