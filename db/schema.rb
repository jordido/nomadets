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

ActiveRecord::Schema.define(version: 20141104232246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_searches", force: true do |t|
    t.integer "category_id"
    t.integer "search_id"
  end

  create_table "categories_users", id: false, force: true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_users", ["category_id"], name: "index_categories_users_on_category_id", using: :btree
  add_index "categories_users", ["user_id"], name: "index_categories_users_on_user_id", using: :btree

  create_table "cities", force: true do |t|
    t.integer "country_id",            null: false
    t.integer "region_id",             null: false
    t.string  "name",       limit: 45, null: false
    t.float   "latitude",              null: false
    t.float   "longitude",             null: false
    t.string  "timezone",   limit: 10, null: false
    t.integer "dma_id"
    t.string  "code",       limit: 4
  end

  add_index "cities", ["name"], name: "index_cities_on_name", using: :btree

  create_table "countries", force: true do |t|
    t.string  "name",                 limit: 50, null: false
    t.string  "fips104",              limit: 2,  null: false
    t.string  "iso2",                 limit: 2,  null: false
    t.string  "iso3",                 limit: 3,  null: false
    t.string  "ison",                 limit: 4,  null: false
    t.string  "internet",             limit: 2,  null: false
    t.string  "capital",              limit: 25
    t.string  "map_reference",        limit: 50
    t.string  "nationality_singular", limit: 35
    t.string  "nationality_plural",   limit: 35
    t.string  "currency",             limit: 30
    t.string  "currency_code",        limit: 3
    t.integer "population"
    t.string  "title",                limit: 50
    t.string  "comment"
  end

  add_index "countries", ["name"], name: "index_countries_on_name", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "subject"
    t.string   "user_id"
    t.string   "description"
    t.string   "calendar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "venue_id"
    t.integer  "teacher_id"
  end

  create_table "regions", force: true do |t|
    t.integer "country_id",            null: false
    t.string  "name",       limit: 45, null: false
    t.string  "code",       limit: 8,  null: false
    t.string  "adm1code",   limit: 4,  null: false
  end

  add_index "regions", ["name"], name: "index_regions_on_name", using: :btree

  create_table "reviews", force: true do |t|
    t.string   "comment"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.integer  "reviewed_id"
    t.integer  "course_id"
  end

  add_index "reviews", ["author_id"], name: "index_reviews_on_author_id", using: :btree
  add_index "reviews", ["course_id"], name: "index_reviews_on_course_id", using: :btree
  add_index "reviews", ["reviewed_id"], name: "index_reviews_on_reviewed_id", using: :btree

  create_table "searches", force: true do |t|
    t.integer  "user_id"
    t.integer  "country_id"
    t.integer  "region_id"
    t.integer  "city_id"
    t.string   "tags"
    t.string   "search_string"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "address"
    t.string   "town"
    t.text     "description"
    t.string   "website_url"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "type"
    t.string   "picture"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.integer  "country_id"
    t.integer  "region_id"
    t.integer  "city_id"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["country_id"], name: "index_users_on_country_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["region_id"], name: "index_users_on_region_id", using: :btree

end
