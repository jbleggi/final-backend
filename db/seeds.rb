require 'faker'

# CREATE CUSTOMERS
customers = []
5.times do
  customers << Customer.create!(
    first_name: Faker::Name.first_name,  
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address_line_1: Faker::Address.street_address,
    address_city: Faker::Address.city,
    address_state: Faker::Address.state,
    address_zip: Faker::Address.zip)
end

# CREATE SUBSCRIPTIONS
subscriptions = []
5.times do 
  customer = customers.sample
  subscriptions << Subscription.create!(
    status: ["active", "canceled"].sample, 
    cost: Faker::Commerce.price(range: 10.0..50.0),
    customer_id: customer.id
  )
end

image_urls = ["https://www.pexels.com/photo/pink-petaled-flowers-near-teacup-and-saucer-1758279/", 
  "https://www.pexels.com/photo/clear-glass-bowl-with-herbs-and-tea-3604314/", 
  "https://www.pexels.com/photo/orange-petaled-flowers-in-clear-glass-pitcher-with-water-on-brown-table-close-up-photography-230489/", 
  "https://www.pexels.com/photo/white-cup-filled-with-orange-liquid-on-top-of-white-saucer-208493/",
  "https://www.pexels.com/photo/sliced-orange-fruit-in-clear-drinking-glass-3323682/"]

# CREATE ITEMS
items = []
5.times do
  items << Item.create!(
    name: Faker::Tea.type,
    number_bags: 20,
    cost: Faker::Commerce.price(range: 5.0..30.0),
    image_url: image_urls.sample
  )
end

5.times do 
  ItemsSubscription.create!(
    subscription_id: subscriptions.sample.id,
    item_id: items.sample.id,
    quantity: rand(1..5)
  )
end

puts "Seeding complete!"
