
Product.destroy_all

10.times do
  product = Product.create!(name: Faker::Space.nebula,
                  price: Faker::Number.between(101,500))
end

10.times do
  product = Product.create!(name: Faker::Space.galaxy,
                  price: Faker::Number.between(501,999))
end
10.times do
  product = Product.create!(name: Faker::Space.planet,
                  price: Faker::Number.between(1,100))
end
10.times do
  product = Product.create!(name: Faker::Space.star_cluster,
                  price: Faker::Number.between(101,500))
end

p "Created #{Product.count} products"
