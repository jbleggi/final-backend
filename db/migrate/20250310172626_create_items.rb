class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :number_bags
      t.decimal :cost
      t.string :image_url

      t.timestamps
    end
  end
end
