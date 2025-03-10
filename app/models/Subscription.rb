class Subscription < ApplicationRecord
  has_many :items, through: :items_subscriptions
  has_many :customers

  after_create :log_new_subscription

  private
    def log_new_subscription
      puts "A new subscription was added"
    end
end

# subscription.items to access items in a subscription