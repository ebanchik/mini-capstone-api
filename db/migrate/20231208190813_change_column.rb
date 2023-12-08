class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :decimal, precision: 7, scale: 2
    change_column :products, :description, :text
  end
end
