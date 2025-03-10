# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Subscription.create(status: "active", cost: 20.00)
Subscription.create(status: "active", cost: 25.00)
Subscription.create(status: "canceled", cost: 20.00)
Subscription.create(status: "paused", cost: 10.00)
Subscription.create(status: "paused", cost: 200.00)