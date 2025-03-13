class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :items_subscriptions
  has_many :items, through: :items_subscriptions

  validates_inclusion_of :status, in: ['active', 'canceled'], message: "%{value} is not a valid status"
end


# subscription.items to access items in a subscription
# subscription.customer to access cust associated with a subs