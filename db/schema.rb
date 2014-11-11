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

ActiveRecord::Schema.define(version: 20141108035955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.integer  "working_day_id"
    t.integer  "status"
    t.datetime "activated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["working_day_id"], name: "index_activities_on_working_day_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "auth_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "working_days", force: true do |t|
    t.date     "worked_on"
    t.integer  "user_id"
    t.integer  "status"
    t.integer  "working_activity_id"
    t.integer  "leaving_activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "working_days", ["leaving_activity_id"], name: "index_working_days_on_leaving_activity_id", using: :btree
  add_index "working_days", ["user_id", "worked_on"], name: "index_working_days_on_user_id_and_worked_on", unique: true, using: :btree
  add_index "working_days", ["user_id"], name: "index_working_days_on_user_id", using: :btree
  add_index "working_days", ["working_activity_id"], name: "index_working_days_on_working_activity_id", using: :btree

end
