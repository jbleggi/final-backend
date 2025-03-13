require 'faker'

# CREATE CUSTOMERS
customers = []
20.times do
  customers << Customer.create!(
    first_name: Faker::Name.first_name,  
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address_line_1: Faker::Address.street_address,
    address_city: Faker::Address.city,
    address_state: Faker::Address.state,
    address_zip: Faker::Address.zip)
end

# CREATE SUBSCRIPTION
subscriptions = []
30.times do 
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
10.times do
  items << Item.create!(
    name: Faker::Tea.type,
    number_bags: 20,
    cost: Faker::Commerce.price(range: 5.0..30.0),
    image_url: image_urls.sample
  )
end

# CREATE ITEMSUBSCRIPTION ENTRIES
subscriptions.each do |subscription|
  items_to_assign = items.sample(3)  
  items_to_assign.each do |item|
    ItemsSubscription.create!(
      subscription_id: subscription.id,
      item_id: item.id,
      quantity: rand(1..5)  # Random quantity per item
    )
  end
end

puts "Seeding complete!"
