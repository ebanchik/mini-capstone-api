class ProductsController < ApplicationController
  def all_products
    all = Product.all
    render json: {"All contacts": all}
  end