class ProductsController < ApplicationController
  def index
    @products = sorted_products
    @order_product = current_order.order_products.new
    @order_products = current_order.order_products
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
