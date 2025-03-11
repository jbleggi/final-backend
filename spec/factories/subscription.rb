FactoryBot.define do
  factory :subscription do
    status { ["active", "canceled"].sample }  # Randomly selects a valid status
    cost { Faker::Commerce.price(range: 10.0..50.0) }
    customer { create(:customer) }
  end
end
