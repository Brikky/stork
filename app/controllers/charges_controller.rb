class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = current_order
    unavailable_items = @order.items_unavailable
    unless unavailable_items.length.zero?
      flash[:error] = "items #{unavailable_items.to_sentence} have a limited stock.Amounts available are #{@order.amount_available.to_sentence}. Please update your order before checkout."
    end
  end

  def create
    begin
      @order = current_order
      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        source: ENV["STRIPE_SECRET_KEY"]
      )

      charge = Stripe::Charge.create(
        customer: customer.id,
        amount: (@order.order_total*100).to_i,
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
