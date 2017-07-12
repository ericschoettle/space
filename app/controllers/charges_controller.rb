class ChargesController < ApplicationController
  def new
  end

  def create
    begin
      # Amount in cents
      @amount = (current_order.total_price * 100).to_i

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
      return
    else
      local_order = current_order
      local_order.status = "Paid"
      local_order.save
    end
  end
end
