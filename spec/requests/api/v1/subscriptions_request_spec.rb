# bundle exec rspec spec/requests/api/v1/subscriptions_request_spec.rb
require 'rails_helper'

describe "Subscriptions API" do 
  it "sends a list of subscriptions" do 
    Subscription.create(status: "active", cost: 20.00)
    Subscription.create(status: "active", cost: 25.00)
    Subscription.create(status: "canceled", cost: 20.00)
    Subscription.create(status: "paused", cost: 10.00)
    Subscription.create(status: "paused", cost: 200.00)

    get '/api/v1/subscriptions'

    expect(response).to be_successful

    subscriptions = JSON.parse(response.body, symbolize_names: true)

    expect(subscriptions.count).to eq(5)

    subscriptions.each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription.id).to be_an Integer

      expect(subscription).to have_key(:status)
      expect(subscription.status).to be_a String

      expect(subscription).to have_key(:cost)
      expect(subscription.cost).to be_a Decimal
    end
  end
end