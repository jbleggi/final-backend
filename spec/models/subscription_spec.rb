# bundle exec rspec spec/models/subscription_spec.rb
require "rails_helper"

RSpec.describe Subscription, type: :model do
  # describe "instance methods" do 
    
  # end

  describe "associations" do
    it { should belong_to(:customer) }
    it { should have_many(:items_subscriptions) }
    it { should have_many(:items).through(:items_subscriptions) }

  end

  describe "validations" do
    it "validates the status as active or canceled" do
      subscription = build(:subscription)
      expect(subscription).to be_valid
      expect(subscription.errors).to be_empty

      new_subscription = build(:subscription, status: "something_else")
      expect(new_subscription).to be_invalid
      expect(new_subscription.errors[:status]).to include("something_else is not a valid status")
    end

  end

end