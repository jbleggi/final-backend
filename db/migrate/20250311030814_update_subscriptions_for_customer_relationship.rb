class UpdateSubscriptionsForCustomerRelationship < ActiveRecord::Migration[7.1]
  def change
    remove_column :customers, :subscription_id, :bigint

    add_reference :subscriptions, :customer, foreign_key: true
  end
end
