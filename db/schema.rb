# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140903142750) do

  create_table "group_members", force: true do |t|
    t.integer  "user_id"
    t.integer  "tipp_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_members", ["tipp_group_id"], name: "index_group_members_on_tipp_group_id"
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id"

  create_table "matchday_points", force: true do |t|
    t.integer  "user_id"
    t.integer  "matchday"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matchday_points", ["user_id"], name: "index_matchday_points_on_user_id"

  create_table "matches", force: true do |t|
    t.string   "home_team"
    t.string   "away_team"
    t.datetime "match_time"
    t.string   "city"
    t.string   "stadium"
    t.integer  "matchday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_goals"
    t.integer  "away_goals"
  end

  create_table "tipp_groups", force: true do |t|
    t.integer  "user_id"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tipp_groups", ["name"], name: "index_tipp_groups_on_name", unique: true
  add_index "tipp_groups", ["user_id"], name: "index_tipp_groups_on_user_id"

  create_table "tipps", force: true do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "home_goals"
    t.integer  "away_goals"
  end

  add_index "tipps", ["match_id"], name: "index_tipps_on_match_id"
  add_index "tipps", ["user_id"], name: "index_tipps_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "points",                 default: 0
    t.integer  "rank"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
