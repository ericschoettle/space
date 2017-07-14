class ProductsController < ApplicationController
  def index
    @products = sorted_products
    if params[:product_id]
      @order_product = OrderProduct.find(params[:product_id])
    else
      @order_product = current_order.order_products.new
    end
    @order_products = current_order.order_products
    binding.pry
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    session[:sort_by] = sort_params[:sort_by]
    session[:direction] = sort_params[:direction]
    redirect_to products_path
  end

  private

  def sort_params
    params.permit(:sort_by, :direction, :utf8, :authenticity_token, :commit)
  end
end
