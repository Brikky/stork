class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  include OrderItemsHelper

  def index
    @order_items = Order.current(session[:order_id], current_user).order_items
  end

  def new
    @order_item = OrderItem.new
  end

  def edit
  end

  def create
    current_order = Order.current(session[:order_id], current_user)
    session[:order_id] = current_order.id
    if current_order.order_items.exists?(item_id: order_item_params[:item_id])
      @order_item = current_order.order_items.find_by(item_id: order_item_params[:item_id])
      @order_item.update_attribute(:quantity, @order_item.quantity + order_item_params[:quantity].to_i)
    else
      @order_item = OrderItem.create(order_item_params)

    end
    flash[:notice] = "#{@order_item.item.name} added to cart"
    redirect_to :back, anchor:"item#{@order_item.item.id}"
  end

  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to order_items_path, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice:  "Removed #{@order_item.item.name}." }
      format.json { head :no_content }
    end
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    quantity = params[:order_item][:quantity]
    quantity = 1 if quantity.nil? || quantity.empty?
    { order_id: Order.current(session[:order_id], current_user).id,
      item_id: params[:order_item][:item], quantity: quantity }
  end
end

# test
