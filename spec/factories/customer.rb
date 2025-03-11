FactoryBot.define do 
  factory :customer do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    address_line_1 { Faker::Address.street_address }
    address_city { Faker::Address.city }
    address_state { Faker::Address.state }
    address_zip { Faker::Address.zip }
  end
end