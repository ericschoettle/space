class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :sorted_products

  def sorted_products
    Product.order(sort_by + " " + sort_direction).paginate(page: params[:page], per_page: 10)
  end

  def current_order
    # If current_user has an unfinished order, return that order
    if return_user_order
      return return_user_order
    # Else if there is an existing odrder (whoever it belongs to) and it is in progress, return that order
    elsif session[:order_id] && Order.find(session[:order_id]).status == "In progress"
      return Order.find(session[:order_id])
    # else make a new order
    else
      return current_or_guest_user.account.orders.new
    end
  end

  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user(with_retry = true)
    @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

  rescue ActiveRecord::RecordNotFound
    session[:guest_user_id] = nil
    guest_user if with_retry
  end

  private
  def sort_by
    session[:sort_by] ||= "price"
  end

  def sort_direction
    session[:sort_direction] ||= "ASC"
  end

  def return_user_order
    if current_user
      current_user.account.orders.each do |order|
        if order.status == "In progress"
          return order
        end
      end
    end
    return false
  end

  def logging_in
    account = guest_user.account
    account.user_id = current_user.id
    account.save
  end

  def create_guest_user
    u = User.create(:email => "guest#{Time.now.to_i}#{rand(100)}@example.com")
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    return u
  end
end
