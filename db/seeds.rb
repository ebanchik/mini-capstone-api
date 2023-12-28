# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

product = Product.new(
  name: "iPhone 15",
  price: 799,
  description: "Same as the last one...but no silence toggle"
)
product.save

product = Product.new(
  name: "iPhone 14",
  price: 699,
  description: "Same as the last one...but better camera"
)

product.save

product = Product.new(
  name: "iPhone 13",
  price: 649,
  description: "Same as the last one"
)
product.save
