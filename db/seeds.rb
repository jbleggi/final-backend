require 'faker'

# CREATE SUBSCRIPTIONS
subscriptions = []
5.times do 
  subscriptions << Subscription.create!(
    status: ["active", "canceled"].sample, 
    cost: Faker::Commerce.price(range: 10.0..50.0)
  )
end

# CREATE CUSTOMERS
5.times do
  subscription = subscriptions.sample
  Customer.create!(
    first_name: Faker::Name.first_name,  
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    address_line_1: Faker::Address.street_address,
    address_city: Faker::Address.city,
    address_state: Faker::Address.state,
    address_zip: Faker::Address.zip, 
    subscription_id: subscription.id)
end

# CREATE ITEMS
items = []
5.times do
  items << Item.create!(
    name: Faker::Tea.type,
    number_bags: 20,
    cost: Faker::Commerce.price(range: 5.0..30.0),
    image_url: "https://www.flaticon.com/free-icons/tea-bag"
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
