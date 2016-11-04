module ApplicationHelper
  def current_order
	unless Order.exists?(session[:order_id])
        @order = Order.create({status: 0})
        session[:order_id] = @order.id
    end
    Order.find(session[:order_id])
  end
end
