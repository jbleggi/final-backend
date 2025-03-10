class AddIndexToItemsSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_index :items_subscriptions, :subscription_id
    add_index :items_subscriptions, :item_id    
  end
end
