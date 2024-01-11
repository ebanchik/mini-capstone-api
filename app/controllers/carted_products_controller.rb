class CartedProductsController < ApplicationController
  

  def create
    @carted_product = CartedProduct.create!(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
      order_id: nil
  )
    render json: @carted_product
  end

  def index
    @carted_products = CartedProduct.where(status: "carted", user_id: current_user.id)
    render :index
  end


  # def destroy
  #   @carted_product = CartedProduct.find_by(id: params[:id])
  #   @product.destroy
  #   render json: {message: "product removed"}
  # end  
end
