class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]
  include OrderItemsHelper
  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.where(order_id: session[:order_id])
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
    @order_item = OrderItem.new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    @order_item = OrderItem.create(order_item_params)
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to items_path, notice:  "#{@order_item.item.name} was successfully created." }
        format.json { render :show, status: :created, location: @order_item }

      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to order_items_url, notice:  "Removed #{@order_item.item.name}." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      unless session[:order_id] 
        @order = Order.create({status: 0})
        session[:order_id] = @order.id
      end
      quantity = params[:order_item][:quantity] || 1 

      {order_id: session[:order_id], item_id: params[:order_item][:item], quantity: quantity}
    end
end