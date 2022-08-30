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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_140250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_matches", force: :cascade do |t|
    t.string "winner"
    t.string "matchable_type", null: false
    t.bigint "matchable_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["matchable_type", "matchable_id"], name: "index_game_matches_on_matchable"
    t.index ["session_id"], name: "index_game_matches_on_session_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "session_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_messages_on_session_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "status"
    t.bigint "sender_id", null: false
    t.bigint "session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sender_id"], name: "index_requests_on_sender_id"
    t.index ["session_id"], name: "index_requests_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "status"
    t.bigint "creator_id", null: false
    t.bigint "joiner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_sessions_on_creator_id"
    t.index ["joiner_id"], name: "index_sessions_on_joiner_id"
  end

  create_table "tic_tac_toe_games", force: :cascade do |t|
    t.string "position_1"
    t.string "position_2"
    t.string "position_3"
    t.string "position_4"
    t.string "position_5"
    t.string "position_6"
    t.string "position_7"
    t.string "position_8"
    t.string "position_9"
    t.bigint "cross_player_id", null: false
    t.bigint "circle_player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_player_id"], name: "index_tic_tac_toe_games_on_circle_player_id"
    t.index ["cross_player_id"], name: "index_tic_tac_toe_games_on_cross_player_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "random_nickname"
    t.string "social_media"
    t.integer "score"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "game_matches", "sessions"
  add_foreign_key "messages", "sessions"
  add_foreign_key "messages", "users"
  add_foreign_key "requests", "sessions"
  add_foreign_key "requests", "users", column: "sender_id"
  add_foreign_key "sessions", "users", column: "creator_id"
  add_foreign_key "sessions", "users", column: "joiner_id"
  add_foreign_key "tic_tac_toe_games", "users", column: "circle_player_id"
  add_foreign_key "tic_tac_toe_games", "users", column: "cross_player_id"
end
