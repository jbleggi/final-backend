# bundle exec rspec spec/models/item_spec.rb
require "rails_helper"

RSpec.describe Item, type: :model do
  # describe "instance methods" do
    
  # end

  describe "associations" do
    it { should have_many(:subscriptions).through(:items_subscriptions) }
    it { should have_many :items_subscriptions }

  end

  # describe "validations" do
    
  # end
end