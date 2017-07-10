class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    current_user.account.orders.new
    # if session[:order_id]
    #   Order.find(session[:order_id])
    # else
    #   current_user.account.orders.new
    # end
  end
end
