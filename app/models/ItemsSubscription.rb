class ItemsSubscription < ApplicationRecord
  belongs_to :item
  belongs_to :subscription
end
