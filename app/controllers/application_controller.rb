class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include OrderItemsHelper

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def current_order
    if current_user
      current_user.orders.find_by(status: 'open')
    elsif session[:order_id].nil?
      order = Order.create(status: 0)
      session[:order_id] = order.id
      order
    else
      Order.find(session[:order_id])
    end
 end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [:first_name, :last_name, :email, :password, :password_confirmation, :full_address, :address, :city, :state, :zipcode, :country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :full_address, :address, :city, :state, :zipcode, :country])
  end
end
