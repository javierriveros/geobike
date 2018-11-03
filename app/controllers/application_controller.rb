class ApplicationController < ActionController::Base
  before_action :set_shopping_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name, :current_password])
    end


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
