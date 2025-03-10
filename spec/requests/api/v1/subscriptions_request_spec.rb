# bundle exec rspec spec/requests/api/v1/subscriptions_request_spec.rb
require 'rails_helper'

describe "Subscriptions API" do 
  it "sends a list of subscriptions" do 
    get '/api/v1/subscriptions'

    expect(response).to be_successful
  end
end