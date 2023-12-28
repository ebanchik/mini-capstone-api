class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  belongs_to :supplier
  has_many :images

  def is_discounted?
    if price <= 10
      return true
    else 
      return false
    end
  end  

  def tax
    tax = (price * 0.09)
    return tax
  end

  def total
    total = (tax + price)
    return total
  end
end
