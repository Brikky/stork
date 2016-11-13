class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.current(session[:user_id], current_user)
    unavailable_items = @order.items_unavailable
    unless unavailable_items.length.zero?
      flash[:error] = "items #{unavailable_items.to_sentence} have a limited stock.Amounts available are #{@order.amount_available.to_sentence}. Please update your order before checkout."
    end
  end

  def create
    @order = Order.current(session[:user_id], current_user)
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: (@order.order_total * 100).to_i,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    handle_payment

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def handle_payment
    session[:order_id] = nil
    @order.update_to_paid
    current_user.new_current_order
  end
end
