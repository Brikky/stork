class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @orders = current_user.orders.where(status: 'paid').order(updated_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.create(status: 0)
    session[:order_id] = @order.id
    @order.items.create(Item.find(params[:format]).dup.as_json)
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    session[:order_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cart cleared.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.fetch(:order, {})
  end
end
