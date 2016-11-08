module ApplicationHelper

  def current_order
    if current_user
      return current_user.orders.last
    elsif session[:order_id].nil?
      order = Order.create({status: 0})
      session[:order_id] = order.id
    else
      Order.find(session[:order_id])
    end
end
end
