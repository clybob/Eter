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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120428184536) do

  create_table "awards", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "badges", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "point_min"
    t.boolean  "unique"
    t.boolean  "shared"
    t.string   "media"
    t.string   "url"
    t.integer  "award_id"
    t.integer  "event_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "badges", ["award_id"], :name => "index_badges_on_award_id"
  add_index "badges", ["event_id"], :name => "index_badges_on_event_id"

  create_table "editorials", :force => true do |t|
    t.string   "uri"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.integer  "points"
    t.integer  "editorial_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "events", ["editorial_id"], :name => "index_events_on_editorial_id"

  create_table "points", :force => true do |t|
    t.integer  "user_id"
    t.integer  "points"
    t.integer  "event_id"
    t.integer  "badge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "premios", :force => true do |t|
    t.string   "award"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
