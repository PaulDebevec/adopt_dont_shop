
ActiveRecord::Schema.define(version: 20200128195907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pets", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.integer "approximate_age"
    t.string "sex"
    t.string "shelter"
    t.bigint "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
  end

  add_foreign_key "pets", "shelters"
end
