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

ActiveRecord::Schema.define(:version => 20130913155520) do

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "bands_events", :force => true do |t|
    t.integer  "band_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bands_events", ["band_id", "event_id"], :name => "index_bands_events_on_band_id_and_event_id", :unique => true
  add_index "bands_events", ["band_id"], :name => "index_bands_events_on_band_id"
  add_index "bands_events", ["event_id"], :name => "index_bands_events_on_event_id"

  create_table "bands_musicians", :force => true do |t|
    t.integer  "band_id"
    t.integer  "musician_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "bands_musicians", ["band_id", "musician_id"], :name => "index_bands_musicians_on_band_id_and_musician_id", :unique => true
  add_index "bands_musicians", ["band_id"], :name => "index_bands_musicians_on_band_id"
  add_index "bands_musicians", ["musician_id"], :name => "index_bands_musicians_on_musician_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "venue_id"
    t.datetime "start"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "end"
  end

  create_table "instruments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "musicians", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "musicians_instruments", :force => true do |t|
    t.integer  "musician_id"
    t.integer  "instrument_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "musicians_instruments", ["instrument_id"], :name => "index_musicians_instruments_on_instrument_id"
  add_index "musicians_instruments", ["musician_id", "instrument_id"], :name => "index_musicians_instruments_on_musician_id_and_instrument_id", :unique => true
  add_index "musicians_instruments", ["musician_id"], :name => "index_musicians_instruments_on_musician_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "customer_id"
    t.string   "last_4_digits"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "post_code"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
