ActiveRecord::Schema[7.1].define(version: 2024_07_02_104522) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "ten_letters_list"
    t.string "word"
    t.boolean "available"
    t.bigint "games_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["games_id"], name: "index_parties_on_games_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "word"
    t.bigint "parties_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parties_id"], name: "index_solutions_on_parties_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "games", "users"
  add_foreign_key "parties", "games", column: "games_id"
  add_foreign_key "solutions", "parties", column: "parties_id"
end
