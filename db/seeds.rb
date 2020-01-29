# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all

products = JSON.parse(File.open("#{Rails.root}/db/seeds/SpocketProducts.json").read)
products.each do |product|
  product['tags'] = product['tags'].split(/, ?/).map(&:strip)
  product['created_at'] = Date.today - rand(1..180).days
  Product.create(product)
end

Product.reindex
