class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

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
    upsert_order_item(current_order)
    flash[:notice] = "#{@order_item.item.name} added to cart"
    redirect_to :back, anchor:"item#{@order_item.item.id}"
  end

  def update
      if @order_item.update(order_item_params)
        redirect_to order_items_path
        flash[:notice] = 'Order item was successfully updated.'
      else
        render :edit
    end
  end

  def destroy
    @order_item.destroy
    redirect_to order_items_url
    flash[:notice] = "Removed #{@order_item.item.name}."
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    quantity = params[:order_item][:quantity]
    quantity = 1 if quantity.nil? || quantity.empty? || quantity < 1
    { order_id: Order.current(session[:order_id], current_user).id,
      item_id: params[:order_item][:item], quantity: quantity }
  end

  def upsert_order_item(current_order)
    id = order_item_params[:item_id]
    if current_order.order_items.exists?(item_id: id)
      update_order_item(current_order, id)
    else
      @order_item = OrderItem.create(order_item_params)
    end
  end

  def update_order_item(current_order, id)
    @order_item = current_order.order_items.find_by(item_id: id)
    @order_item.update_attribute(:quantity, @order_item.quantity + order_item_params[:quantity].to_i)
  end
end
