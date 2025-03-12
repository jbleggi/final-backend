class ChangeCustomerIdToCustomerIdsInSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :subscriptions, :customer_id, :bigint

    add_column :subscriptions, :customer_ids, :bigint, array: true, default: []
  end
end
