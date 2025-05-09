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

ActiveRecord::Schema[8.0].define(version: 2025_02_02_181707) do
  create_table "authentications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "gears", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "length"
    t.integer "width"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gear_type", null: false
  end

  create_table "groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "voting_start_at"
    t.datetime "voting_end_at"
    t.integer "top_voted_post_id"
    t.string "token"
    t.index ["token"], name: "index_groups_on_token", unique: true
  end

  create_table "information", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "start_day"
    t.date "finish_day"
    t.string "camp_site_name"
    t.string "camp_site_address"
    t.string "camp_site_url"
    t.integer "car"
    t.string "start_point"
    t.datetime "check_in"
    t.datetime "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.bigint "user_id"
    t.text "content"
    t.index ["group_id"], name: "fk_rails_841b0ae6ac"
    t.index ["user_id"], name: "fk_rails_273a25a7a6"
  end

  create_table "my_gears", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "gear_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gear_id"], name: "index_my_gears_on_gear_id"
    t.index ["group_id"], name: "index_my_gears_on_group_id"
    t.index ["user_id"], name: "index_my_gears_on_user_id"
  end

  create_table "posts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "camp_site_name"
    t.string "camp_site_address"
    t.string "camp_site_url"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "group_id"
    t.bigint "user_id"
    t.index ["group_id"], name: "index_posts_on_group_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "schedules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "scheduled_at"
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_schedules_on_group_id"
  end

  create_table "tops", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  create_table "users_gears", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "gear_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gear_id"], name: "index_users_gears_on_gear_id"
    t.index ["user_id", "gear_id"], name: "index_users_gears_on_user_id_and_gear_id", unique: true
    t.index ["user_id"], name: "index_users_gears_on_user_id"
  end

  create_table "users_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
    t.index ["group_id"], name: "index_users_groups_on_group_id"
    t.index ["user_id"], name: "index_users_groups_on_user_id"
  end

  create_table "votes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_votes_on_post_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "messages", "groups"
  add_foreign_key "messages", "users"
  add_foreign_key "my_gears", "gears"
  add_foreign_key "my_gears", "groups"
  add_foreign_key "my_gears", "users"
  add_foreign_key "posts", "groups"
  add_foreign_key "schedules", "groups"
  add_foreign_key "users_gears", "gears"
  add_foreign_key "users_gears", "users"
  add_foreign_key "users_groups", "groups"
  add_foreign_key "users_groups", "users"
  add_foreign_key "votes", "posts"
  add_foreign_key "votes", "users"
end
