class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include OrderItemsHelper

  def current_order
  	Order.find(session[:order_id])
  end
end
