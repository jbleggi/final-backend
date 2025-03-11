# bundle exec rspec spec/models/item_subscription_spec.rb
require "rails_helper"

RSpec.describe ItemsSubscription, type: :model do
  # describe "instance methods" do
    
  # end

  describe "associations" do
    it { should belong_to(:item) }
    it { should belong_to(:subscription) }
  end

  # describe "validations" do
    
  # end
end