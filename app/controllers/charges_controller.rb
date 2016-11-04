class ChargesController < ApplicationController
  before_action :authenticate_user!

	def new
		@amount = Order.find(session[:order_id]).order_total
	end

	def create
	  # Amount in cents
	  @amount = Order.find(session[:order_id]).order_total*100

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => current_user.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path
	end
end
