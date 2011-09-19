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

ActiveRecord::Schema.define(:version => 20110919135216) do

  create_table "users", :force => true do |t|
    t.string   "steam_id64"
    t.string   "steam_real_name"
    t.string   "steam_privacy_state"
    t.string   "steam_nickname"
    t.string   "steam_custom_url"
    t.string   "steam_base_url"
    t.string   "steam_full_avatar_url"
    t.string   "steam_medium_avatar_url"
    t.string   "steam_icon_url"
    t.string   "twitter_uid"
    t.string   "twitter_real_name"
    t.string   "twitter_token"
    t.string   "twitter_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "login_account",           :default => false
    t.string   "twitter_handle"
  end

end
