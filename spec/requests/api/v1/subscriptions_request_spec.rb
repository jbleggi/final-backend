# bundle exec rspec spec/requests/api/v1/subscriptions_request_spec.rb
require 'rails_helper'

describe "Subscriptions API" do 
  it "sends a list of subscriptions" do
    get api_v1_subscriptions_path

    expect(response).to be_successful

    results = JSON.parse(response.body, symbolize_names: true)

    expect(results.count).to eq(5)

    results.each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription.id).to be_an Integer

      expect(subscription).to have_key(:status)
      expect(subscription.status).to be_a String

      expect(subscription).to have_key(:cost)
      expect(subscription.cost).to be_a Decimal
    end
  end
end