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

ActiveRecord::Schema.define(version: 20161025091231) do

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "post_id"
    t.integer  "priority"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "flag_file_name"
    t.string   "flag_content_type"
    t.integer  "flag_file_size"
    t.datetime "flag_updated_at"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "favorites", ["post_id"], name: "index_favorites_on_post_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "following_user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "follows", ["following_user_id"], name: "index_follows_on_following_user_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "post_id"
    t.integer  "priority"
    t.decimal  "lat"
    t.decimal  "lng"
  end

  create_table "photos", force: :cascade do |t|
    t.string   "photo_location"
    t.integer  "post_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "photos", ["post_id"], name: "index_photos_on_post_id"

  create_table "post_countryships", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "post_countryships", ["country_id"], name: "index_post_countryships_on_country_id"
  add_index "post_countryships", ["post_id"], name: "index_post_countryships_on_post_id"

  create_table "post_locationships", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "post_locationships", ["location_id"], name: "index_post_locationships_on_location_id"
  add_index "post_locationships", ["post_id"], name: "index_post_locationships_on_post_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "origin"
    t.string   "destination"
    t.date     "start_date"
    t.float    "distance",    default: 0.0
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.date     "return_date"
    t.string   "status",      default: "published"
    t.datetime "publish_on"
  end

  create_table "user_countryships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_countryships", ["country_id"], name: "index_user_countryships_on_country_id"
  add_index "user_countryships", ["user_id"], name: "index_user_countryships_on_user_id"

  create_table "user_locationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_locationships", ["location_id"], name: "index_user_locationships_on_location_id"
  add_index "user_locationships", ["user_id"], name: "index_user_locationships_on_user_id"

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "name"
    t.string   "image"
    t.string   "fb_token"
    t.datetime "fb_expires_at"
    t.string   "about_user"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

end
