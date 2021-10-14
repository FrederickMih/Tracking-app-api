

ActiveRecord::Schema.define(version: 2021_10_01_023058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "measurements", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image_url"], name: "index_measurements_on_image_url"
    t.index ["name"], name: "index_measurements_on_name"
  end

  create_table "measures", force: :cascade do |t|
    t.float "value"
    t.bigint "measurement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["measurement_id"], name: "index_measures_on_measurement_id"
    t.index ["value"], name: "index_measures_on_value"
  end

  add_foreign_key "measures", "measurements"
end
