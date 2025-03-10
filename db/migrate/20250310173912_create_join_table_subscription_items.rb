class CreateJoinTableSubscriptionItems < ActiveRecord::Migration[7.1]
  def change
    create_join_table :subscriptions, :items do |t|
      t.index [:subscription_id, :item_id]
      # t.index [:item_id, :subscription_id]
    end
  end
end
