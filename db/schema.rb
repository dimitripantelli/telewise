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

ActiveRecord::Schema.define(version: 2021_12_01_104155) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "episodes", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.integer "season_number"
    t.date "airing_date"
    t.string "name"
    t.integer "episode_number"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_episodes_on_show_id"
  end

  create_table "followed_shows", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "show_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_followed_shows_on_show_id"
    t.index ["user_id"], name: "index_followed_shows_on_user_id"
  end

  create_table "progresses", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "episode_id", null: false
    t.boolean "watched"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["episode_id"], name: "index_progresses_on_episode_id"
    t.index ["user_id"], name: "index_progresses_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "show_id", null: false
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_reviews_on_show_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "season_summaries", force: :cascade do |t|
    t.bigint "show_id", null: false
    t.integer "season_number"
    t.text "summary"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["show_id"], name: "index_season_summaries_on_show_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.text "summary"
    t.integer "number_of_seasons"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "rating"
    t.string "streaming"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "episodes", "shows"
  add_foreign_key "followed_shows", "shows"
  add_foreign_key "followed_shows", "users"
  add_foreign_key "progresses", "episodes"
  add_foreign_key "progresses", "users"
  add_foreign_key "reviews", "shows"
  add_foreign_key "reviews", "users"
  add_foreign_key "season_summaries", "shows"
end
