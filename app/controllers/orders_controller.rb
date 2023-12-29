class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    subtotal = product.price * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
 )
    render json: { message: "Order created successfully" }, status: :created
  end

  def show
    # the_id = params[:id]
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    end
  end

  def index
    @orders = Order.where(user_id: current_user.id)
    render json: @order
  end

end
