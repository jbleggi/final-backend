# bundle exec rspec spec/models/customer_spec.rb
require "rails_helper"

RSpec.describe Customer, type: :model do
  # describe "instance methods" do
    
  # end

  describe "associations" do
    it { should have_many :subscriptions }
  end

  # describe "validations" do
    
  # end
end