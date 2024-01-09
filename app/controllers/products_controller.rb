class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:show, :index]
  
  def index
    pp current_user
    @products = Product.all
    render template: "products/index"
  end

  def show
    # the_id = params[:id]
    @product = Product.find_by(id: params[:id])
    render template: "products/show"
  end

  def create
    @product = Product.new(
      name: params[:name], 
      price: params[:price], 
      supplier_id: params[:supplier_id],
      description: params[:description],
      inventory: params[:inventory]
    )

    if @product.save
      render template: "products/show"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      supplier_id: params[:supplier_id] || @product.supplier_id,
      description: params[:description] || @product.description
    )
    @product.save
    render :show
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "product removed"}
  end

  def name
    @product = product.supplier.name
  end
end