class HomeController < ApplicationController
  # def index
  #   @orders = current_user.orders.order('created_at desc')
  # end

  # def unregistered
  #   render layout: 'landing'
  # end

  def about
  end

  def terms
  end

  def success
    if @shopping_cart.payed?
      cookies[:shopping_cart_id] = nil
    else
      redirect_to cart_path
    end
  end
end
