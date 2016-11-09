class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if current_user && session[:order_id]
        current_user.current_order.merge_order(Order.find(session[:order_id]["id"]))
        flash[:notice] = "You had items in your cart, your order has been updated. Click #{ view_context.link_to 'here', order_items_path } to revise your order."
      else
      session[:order_id] = current_user.current_order
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
