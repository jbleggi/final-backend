class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.string :status
      t.decimal :cost

      t.timestamps
    end
  end
end
