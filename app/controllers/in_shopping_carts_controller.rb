class InShoppingCartsController < ApplicationController
  def create
    in_shopping_cart = InShoppingCart.create(product_id: params[:product_id], shopping_cart: @shopping_cart)
    respond_to do |format|
      if in_shopping_cart.save
        format.json { render json: { message: "Se agregó el producto al carrito"} }
      else
        format.json { render json: { error: "No pudimos agregar el producto al carrito" } }
      end
    end
  end

  def update
    @in_shopping_cart = InShoppingCart.find(params[:id])
    if @in_shopping_cart.update(params.require(:in_shopping_cart).permit(:quantity))
      redirect_to cart_path
    else
      redirect_to cart_path, notice: 'Hubo un error'
    end
  end

  def destroy
    @in_shopping_cart = InShoppingCart.find(params[:id])
    @in_shopping_cart.destroy
    redirect_to cart_path, notice: "Producto removido"
  end
end
