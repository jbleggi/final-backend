ActiveRecord::Schema[7.1].define(version: 2025_03_10_175413) do
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "address_city"
    t.string "address_state"
    t.string "address_zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subscription_id"
    t.index ["subscription_id"], name: "index_customers_on_subscription_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "number_bags"
    t.decimal "cost"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_subscriptions", id: false, force: :cascade do |t|
    t.bigint "subscription_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.index ["item_id"], name: "index_items_subscriptions_on_item_id"
    t.index ["subscription_id", "item_id"], name: "index_items_subscriptions_on_subscription_id_and_item_id"
    t.index ["subscription_id"], name: "index_items_subscriptions_on_subscription_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "status"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "customers", "subscriptions"
end
