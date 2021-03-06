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

ActiveRecord::Schema.define(:version => 20130922210643) do

  create_table "categories", :force => true do |t|
    t.string   "cuisine"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "restaurant_id"
  end

  create_table "categories_restaurants", :force => true do |t|
    t.integer "category_id"
    t.integer "restaurant_id"
  end

  create_table "reservations", :force => true do |t|
    t.string   "date"
    t.string   "time"
    t.integer  "partySize"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "reservation_date"
    t.integer  "restaurant_id"
    t.integer  "user_id"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.string   "addr"
    t.string   "phone"
    t.integer  "seats"
    t.string   "picture"
    t.string   "open_hour"
    t.string   "close_hour"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "website"
    t.integer  "user_id"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.integer  "category_ids"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role"
  end

end
