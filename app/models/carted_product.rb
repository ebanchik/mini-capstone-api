class CartedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional:true
  # has_many :categories, through: :category_products
end
