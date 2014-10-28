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

ActiveRecord::Schema.define(version: 20141028180547) do

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

  create_table "reviews", force: true do |t|
    t.string   "author_id"
    t.string   "reviewed_id"
    t.string   "comment"
    t.integer  "rating"
    t.string   "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["author_id"], name: "index_reviews_on_author_id", using: :btree
  add_index "reviews", ["course_id"], name: "index_reviews_on_course_id", using: :btree
  add_index "reviews", ["reviewed_id"], name: "index_reviews_on_reviewed_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "address"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.string   "description"
    t.string   "website_url"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "type"
    t.integer  "category_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
