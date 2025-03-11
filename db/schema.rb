# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_03_11_030814) do
  # These are extensions that must be enabled in order to support this database
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
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_subscriptions_on_customer_id"
  end

  add_foreign_key "subscriptions", "customers"
end
