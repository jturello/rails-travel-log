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

ActiveRecord::Schema.define(version: 20161007085651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "blurb",       null: false
    t.text     "description", null: false
    t.string   "language"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "sub_region"
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "blurb",       null: false
    t.text     "description", null: false
    t.string   "image_url"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["country_id"], name: "index_destinations_on_country_id", using: :btree
  end

  create_table "forecasts", force: :cascade do |t|
    t.integer  "api_timestamp",                               null: false
    t.string   "timezone"
    t.string   "date"
    t.text     "summary"
    t.string   "icon"
    t.decimal  "temp"
    t.decimal  "humidity"
    t.decimal  "windspeed"
    t.decimal  "precip_probability"
    t.text     "summary_for_week"
    t.integer  "destination_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.decimal  "latitude",           precision: 10, scale: 6, null: false
    t.decimal  "longitude",          precision: 10, scale: 6, null: false
    t.index ["api_timestamp"], name: "index_forecasts_on_api_timestamp", using: :btree
    t.index ["destination_id"], name: "index_forecasts_on_destination_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content",          null: false
    t.integer  "user_id",          null: false
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_id", "commentable_type"], name: "index_posts_on_commentable_id_and_commentable_type", using: :btree
    t.index ["commentable_type", "commentable_id"], name: "index_posts_on_commentable_type_and_commentable_id", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "destinations", "countries"
  add_foreign_key "forecasts", "destinations"
  add_foreign_key "posts", "users"
end
