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

ActiveRecord::Schema[7.2].define(version: 2025_03_22_034830) do
  create_table "articles", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "category_id"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
    t.index ["status_id"], name: "index_articles_on_status_id"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "general_id", null: false
    t.string "tag", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "articles_count", default: 0, null: false
    t.index ["general_id"], name: "index_categories_on_general_id"
  end

  create_table "general_settings", force: :cascade do |t|
    t.string "group", null: false
    t.string "code", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.index ["group", "code"], name: "index_general_settings_group_and_code", unique: true
  end

  add_foreign_key "articles", "categories"
  add_foreign_key "articles", "general_settings", column: "status_id"
  add_foreign_key "categories", "general_settings", column: "general_id"
end
