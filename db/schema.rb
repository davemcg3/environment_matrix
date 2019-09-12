# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_12_062128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enterprises", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "environments_id", null: false
    t.bigint "services_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["environments_id"], name: "index_enterprises_on_environments_id"
    t.index ["services_id"], name: "index_enterprises_on_services_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "projects_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["projects_id"], name: "index_environments_on_projects_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.bigint "environment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["environment_id"], name: "index_services_on_environment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role", default: 2
    t.string "api_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "enterprises", "environments", column: "environments_id"
  add_foreign_key "enterprises", "services", column: "services_id"
  add_foreign_key "environments", "projects", column: "projects_id"
  add_foreign_key "services", "environments"
end
