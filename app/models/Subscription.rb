class Subscription < ApplicationRecord
  has_and_belongs_to_many :items, through: :items_subscriptions
  has_many :items_subscriptions

  validates :status, inclusion: { in: ['active', 'canceled'], message: "%{value} is not a valid status" }, presence: true
end

# subscription.items to access items in a subscription
# subscription.customer to access cust associated with a subs