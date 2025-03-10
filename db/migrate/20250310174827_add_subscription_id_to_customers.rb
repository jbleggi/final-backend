class AddSubscriptionIdToCustomers < ActiveRecord::Migration[7.1]
  def change
    add_column :customers, :subscription_id, :integer
    add_index :customers, :subscription_id
    add_foreign_key :customers, :subscriptions, column: :subscription_id
  end
end
