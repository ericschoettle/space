class OrderProductsController < ApplicationController
  def show
    @order_products = current_order.order_products
  end

  def index
    @order_products = current_order.order_products
  end

  def create
    @order = current_order
    @product = @order.order_products.new(product_params)
    @order.save
    session[:order_id] = @order.id

    @product_id = product_params[:product_id]
    respond_to do |f|
      f.html { redirect_to products_path }
      f.js
    end

  end

  def destroy
    @order_product = OrderProduct.find(params[:id])
    @order = current_order
    @product = @order.order_products.find(params[:id])
    @product.destroy
    @order.save

    respond_to do |f|
      f.html { redirect_to order_products_path }
      f.js
    end
  end

  private

  def product_params
    params.require(:order_product).permit(:quantity, :product_id)
  end
end
