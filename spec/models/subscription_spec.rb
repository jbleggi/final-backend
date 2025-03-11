# bundle exec rspec spec/models/subscription_spec.rb
require "rails_helper"

RSpec.describe Subscription, type: :model do
  describe "instance methods" do 
    
  end

  describe "relationships" do
    
  end

  describe "validations" do
    it 'is valid with a status of active' do
      subscription = Subscription.new(status: 'active')
      expect(subscription).to be_valid
    end
  
    it 'is valid with a status of canceled' do
      subscription = Subscription.new(status: 'canceled')
      expect(subscription).to be_valid
    end
  
    it 'is invalid with a status that is not active or canceled' do
      subscription = Subscription.new(status: 'expired')
      expect(subscription).not_to be_valid
      expect(subscription.errors[:status]).to include('expired is not a valid status')
    end
  
    it 'is invalid without a status' do
      subscription = Subscription.new(status: nil)
      expect(subscription).not_to be_valid
      expect(subscription.errors[:status]).to include("can't be blank")
    end
  end
end