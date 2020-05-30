ActiveRecord::Schema.define(version: 2020_05_29_185915) do
  create_table "batches", force: :cascade do |t|
      t.string "reference"
      t.string "purchase_channel"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
    create_table "orders", force: :cascade do |t|
      t.string "reference"
      t.string "client_name"
      t.string "purchase_channel"
      t.string "address"
      t.string "delivery_service"
      t.string "total_value"
      t.string "line_items"
      t.string "status"
      t.integer "batch_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["batch_id"], name: "index_orders_on_batch_id"
    end
end
