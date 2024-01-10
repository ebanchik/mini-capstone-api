class OrdersController < ApplicationController
  
  def create
    
    @carted_products = CartedProduct.all.where(user_id: current_user.id, status: "carted")
    
    calculated_subtotal = 0
    
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    end
    
    tax_rate = 0.09
    tax = calculated_subtotal * tax_rate
    calculated_total = (calculated_subtotal + tax)

    p tax
    p calculated_subtotal.to_s
    p calculated_total.to_s
    

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: tax,
      total: calculated_total
    )

    if @order.save!
      render template: "orders/show"
      @carted_products.each do |carted_product|
        carted_product.status = "purchases"
        carted_product.order_id = @order.id
        p carted_product.status
        p carted_product.order_id
        carted_product.save
      end
    
    else
      render json: {message: "There was a problem creating your order"}
      
    end
    
  end

  def show
    # the_id = params[:id]
    @order = Order.find_by(id: params[:id])
    if @order.user_id == current_user.id
      render :show
    else
      render json: {message: "You can't do this."}
    end
  end

  def index
    @orders = current_user.orders
    render :index
  end

end
