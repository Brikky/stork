class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.find(session[:order_id])
    # Amount in cents
    @amount = @order.order_total
  end

  def create
    begin
      @order = Order.find(session[:order_id])
      # Amount in cents
      @amount = @order.order_total

      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd'
      )

      @order.handle_payment

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

    end
  end
end
