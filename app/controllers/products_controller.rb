class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:search]).order(sort_direction).paginate(page: params[:page], per_page: 10)
    @order_product = current_order.order_products.new
    @order_products = current_order.order_products
  end
end
