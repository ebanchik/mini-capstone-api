class CartedProduct < ApplicationRecord
  has_many :users
  belongs_to :product
  belongs_to :order, optional:true
  has_many :categories, through: :category_products
end
