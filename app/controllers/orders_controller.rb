class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:destroy]

  def index
    @orders = current_user.orders.where(status: 'paid').order(updated_at: :desc)
  end

  def show
  end

  def new
    @order = Order.create()
    session[:order_id] = @order.id
    @order.items.create(Item.find(params[:format]).dup.as_json)
  end

  def destroy
    @order.destroy
    session[:order_id] = nil
    current_user.new_current_order if current_user 
    flash[:notice] = 'Cart cleared.'
    redirect_to root_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.fetch(:order, {})
  end
end
