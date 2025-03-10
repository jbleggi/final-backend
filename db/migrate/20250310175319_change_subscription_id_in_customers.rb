class ChangeSubscriptionIdInCustomers < ActiveRecord::Migration[7.1]
  def change
    change_column :customers, :subscription_id, :bigint
  end
end
