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

ActiveRecord::Schema.define(version: 2020_06_16_211221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.datetime "viewed_on"
    t.bigint "user_id", null: false
    t.bigint "video_id", null: false
    t.boolean "favourite", default: false, null: false
    t.boolean "viewed", default: false, null: false
    t.string "difficulty"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "completed", default: false, null: false
    t.index ["user_id"], name: "index_interactions_on_user_id"
    t.index ["video_id"], name: "index_interactions_on_video_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "status"
    t.decimal "rookie_completed"
    t.decimal "intermediate_completed"
    t.decimal "pro_completed"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.integer "rating"
    t.string "difficulty"
    t.bigint "user_id", null: false
    t.bigint "sub_category_id", null: false
    t.string "you_tube_key"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "style"
    t.integer "totalrating"
    t.index ["sub_category_id"], name: "index_videos_on_sub_category_id"
    t.index ["user_id"], name: "index_videos_on_user_id"
  end

  add_foreign_key "interactions", "users"
  add_foreign_key "interactions", "videos"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "videos", "sub_categories"
  add_foreign_key "videos", "users"
end
