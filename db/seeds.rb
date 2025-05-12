# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create admin user
admin = User.create!(
  email: 'apascal389@gmail.com',
  password: 'nitanation',
  password_confirmation: 'nitanation'
)
admin.add_role(:admin)

# Create seller user
# seller = User.create!(
#   email: 'derick@example.com',
#   password: 'password',
#   password_confirmation: 'password'
# )
# seller.add_role(:seller)

# #Create categories
# categories = ['Electronics', 'Clothing', 'Groceries', 'Home Goods'].map do |name|
#   Category.create!(name: name)
# end

# # Create products
# products = [
#   { name: 'Smartphone', size: '6.1"', quantity: 50, purchase_price: 500, selling_price: 699, low_stock_threshold: 10, category: categories[0] },
#   { name: 'Laptop', size: '15.6"', quantity: 30, purchase_price: 800, selling_price: 1199, low_stock_threshold: 5, category: categories[0] },
#   { name: 'T-Shirt', size: 'M', quantity: 100, purchase_price: 10, selling_price: 24.99, low_stock_threshold: 20, category: categories[1] },
#   { name: 'Jeans', size: '32x34', quantity: 75, purchase_price: 25, selling_price: 59.99, low_stock_threshold: 15, category: categories[1] },
#   { name: 'Milk', size: '1 Gallon', quantity: 200, purchase_price: 2.5, selling_price: 3.99, low_stock_threshold: 30, category: categories[2] },
#   { name: 'Bread', size: 'Loaf', quantity: 150, purchase_price: 1.5, selling_price: 2.99, low_stock_threshold: 25, category: categories[2] },
#   { name: 'Pillow', size: 'Standard', quantity: 60, purchase_price: 8, selling_price: 19.99, low_stock_threshold: 10, category: categories[3] },
#   { name: 'Blanket', size: 'Queen', quantity: 40, purchase_price: 15, selling_price: 39.99, low_stock_threshold: 8, category: categories[3] }
# ].map do |attrs|
#   Product.create!(attrs)
# end

# # Create some daily sales
# 7.times do |i|
#   date = Date.today - i.days
#   products.each do |product|
#     next if rand > 0.4 # Randomly skip some products

#     quantity_sold = rand(1..5)
#     DailySale.create!(
#       date: date,
#       user_id: 2,
#       product: product,
#       quantity_sold: quantity_sold,
#       remaining_quantity: product.quantity - quantity_sold,
#       total_profit: quantity_sold * (product.selling_price - product.purchase_price)
#     )
#     product.update!(quantity: product.quantity - quantity_sold)
#   end
# end