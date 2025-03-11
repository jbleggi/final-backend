class Subscription < ApplicationRecord
  has_and_belongs_to_many :items, through: :items_subscriptions
  has_many :items_subscriptions

end

# subscription.items to access items in a subscription
# subscription.customer to access cust associated with a subs