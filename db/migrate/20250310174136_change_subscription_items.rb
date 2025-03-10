class ChangeSubscriptionItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items_subscriptions, :quantity, :integer
  end
end
