class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = current_order
    # Amount in cents
    @order.update({status: 1})
  end

  def create
    begin
      @order = Order.find(session[:order_id])
      # Amount in cents

      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @order.order_total,
        description: 'Rails Stripe customer',
        currency: 'usd'
      )

      @order.handle_payment
      current_user.new_current_order

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

    end
  end
end
