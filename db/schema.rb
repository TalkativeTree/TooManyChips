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

ActiveRecord::Schema.define(:version => 20130707013711) do

  create_table "assigned_items", :force => true do |t|
    t.integer "event_item_id"
    t.integer "quantity_provided", :null => false
    t.integer "guest_id"
  end

  create_table "event_items", :force => true do |t|
    t.integer  "event_id"
    t.string   "description"
    t.integer  "item_id"
    t.integer  "quantity_needed", :default => 1
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.boolean  "guest_created",   :default => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "date"
    t.string   "location"
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "image"
    t.string   "state"
    t.string   "city"
    t.string   "zip"
    t.integer  "type_id"
    t.string   "font_color"
    t.string   "font_family"
    t.boolean  "allow_guest_create", :default => false
    t.string   "background_color"
    t.string   "host_name"
    t.string   "street_address"
  end

  create_table "guests", :force => true do |t|
    t.string "email"
    t.string "name"
    t.string "url"
  end

  create_table "items", :force => true do |t|
    t.text     "suggestion"
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "type_id"
  end

  create_table "types", :force => true do |t|
    t.string  "name"
    t.integer "typeable_id"
    t.string  "typeable_type"
  end

  create_table "users", :force => true do |t|
    t.string   "email",            :null => false
    t.string   "name",             :null => false
    t.string   "password_digest",  :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
