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

ActiveRecord::Schema.define(version: 20160602175846) do

  create_table "activities", force: :cascade do |t|
    t.string   "activity_name"
    t.string   "description"
    t.string   "leader"
    t.string   "company_name"
    t.string   "adress"
    t.integer  "max_perticipants"
    t.integer  "price"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "activity_dates", force: :cascade do |t|
    t.datetime "date"
    t.integer  "adventure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "activity_dates", ["adventure_id"], name: "index_activity_dates_on_adventure_id"

  create_table "adventures", force: :cascade do |t|
    t.string   "activity_name"
    t.string   "description"
    t.string   "leader"
    t.string   "company_name"
    t.string   "adress"
    t.integer  "max_perticipants"
    t.integer  "price"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "currency"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "adventures", ["user_id"], name: "index_adventures_on_user_id"

  create_table "available_dates", force: :cascade do |t|
    t.integer  "timeslot_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "available_dates", ["timeslot_id"], name: "index_available_dates_on_timeslot_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "adventure_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["adventure_id"], name: "index_photos_on_adventure_id"

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "adventure_id"
    t.datetime "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "perticipants"
    t.integer  "total_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "price"
    t.boolean  "status"
  end

  add_index "reservations", ["adventure_id"], name: "index_reservations_on_adventure_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "star"
    t.integer  "adventure_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "reviews", ["adventure_id"], name: "index_reviews_on_adventure_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "time_slots", force: :cascade do |t|
    t.integer  "activity_date_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "start_time"
    t.datetime "end_time"
  end

  add_index "time_slots", ["activity_date_id"], name: "index_time_slots_on_activity_date_id"

  create_table "timeslots", force: :cascade do |t|
    t.datetime "start_time"
    t.string   "end_time"
    t.string   "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "fullname"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "phone_number"
    t.text     "description"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
