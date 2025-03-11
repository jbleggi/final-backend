# bundle exec rspec spec/requests/api/v1/subscriptions_request_spec.rb
require 'rails_helper'

describe "Subscriptions API" do 
  it "can send a list of subscriptions" do
    get api_v1_subscriptions_path

    expect(response).to be_successful
    
    results = JSON.parse(response.body, symbolize_names: true)

    expect(results[:data].count).to eq(5)

    results[:data].each do |subscription|
      expect(subscription[:attributes]).to have_key(:id)
      expect(subscription[:attributes]).to have_key(:status)
      expect(subscription[:attributes]).to have_key(:cost)
    end
  end

  it "can retrieve one subscription based on id" do
    id = Subscription.first.id

    get "/api/v1/subscriptions/#{id}"

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(result[:data][:attributes]).to have_key(:id)
    expect(result[:data][:attributes]).to have_key(:status)
    expect(result[:data][:attributes]).to have_key(:cost)
    expect(result[:data][:attributes][:id]).to eq id
  end

end