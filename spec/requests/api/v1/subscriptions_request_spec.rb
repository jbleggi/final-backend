# bundle exec rspec spec/requests/api/v1/subscriptions_request_spec.rb
require 'rails_helper'

describe "Subscriptions API" do 
  before do
    5.times do 
      create(:subscription)
    end
  end
  
  it "can send a list of subscriptions" do
    get api_v1_subscriptions_path

    expect(response).to be_successful
    
    results = JSON.parse(response.body, symbolize_names: true)
 
    expect(results[:subscriptions].count).to eq(5)

    results[:subscriptions].each do |subscription|
      expect(subscription).to have_key(:id)
      expect(subscription).to have_key(:status)
      expect(subscription).to have_key(:cost)
    end
  end

  it "can retrieve one subscription based on id" do
    id = Subscription.first.id

    get api_v1_subscription_path(id)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(result[:data][:attributes]).to have_key(:id)
    expect(result[:data][:attributes]).to have_key(:status)
    expect(result[:data][:attributes]).to have_key(:cost)
    expect(result[:data][:attributes][:id]).to eq id
  end

  it "can edit the status of a subscription based on id" do
    id = Subscription.first.id
    previous_status = Subscription.first.status
    updated_status_params = { status: "canceled" }
    headers = {"CONTENT_TYPE" => "application/json"}

    patch api_v1_subscription_path(id), headers: headers, params: JSON.generate(updated_status_params)

    subscription = Subscription.find_by(id: id)

    expect(response).to be_successful
    expect(subscription.status).to_not eq(previous_status)
  end
end