class Item < ApplicationRecord
  has_many :subscriptions, through: :items_subscriptions
end        

#item.subscriptions to access subscriptions associated with an item