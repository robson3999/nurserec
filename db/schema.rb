# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_20_163825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "medicament_group_substances", force: :cascade do |t|
    t.bigint "substance_id"
    t.bigint "medicament_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicament_group_id"], name: "index_medicament_group_substances_on_medicament_group_id"
    t.index ["substance_id"], name: "index_medicament_group_substances_on_substance_id"
  end

  create_table "medicament_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medicament_medicament_groups", force: :cascade do |t|
    t.bigint "medicament_id"
    t.bigint "medicament_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicament_group_id"], name: "index_medicament_medicament_groups_on_medicament_group_id"
    t.index ["medicament_id"], name: "index_medicament_medicament_groups_on_medicament_id"
  end

  create_table "medicament_substances", force: :cascade do |t|
    t.bigint "medicament_id"
    t.bigint "substance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medicament_id"], name: "index_medicament_substances_on_medicament_id"
    t.index ["substance_id"], name: "index_medicament_substances_on_substance_id"
  end

  create_table "medicaments", force: :cascade do |t|
    t.string "name"
    t.integer "status", default: 0
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "substances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "medicament_group_substances", "medicament_groups"
  add_foreign_key "medicament_group_substances", "substances"
  add_foreign_key "medicament_medicament_groups", "medicament_groups"
  add_foreign_key "medicament_medicament_groups", "medicaments"
  add_foreign_key "medicament_substances", "medicaments"
  add_foreign_key "medicament_substances", "substances"
end
