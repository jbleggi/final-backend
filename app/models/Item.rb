class Item < ApplicationRecord
  has_and_belongs_to_many :subscriptions, join_table: :items_subscriptions
  has_many :items_subscriptions
end        

#item.subscriptions to access subscriptions associated with an item