class InShoppingCartsController < ApplicationController
  def create
    in_shopping_cart = InShoppingCart.create(product_id: params[:product_id], shopping_cart: @shopping_cart)
    if in_shopping_cart.save
      redirect_to cart_path, notice: "Agregamos el producto a tu carrito"
    else
      redirect_to products_path(id: params[:product_id]), notice: "No pudimos agregar el producto al carrito"
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
