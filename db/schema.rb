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

ActiveRecord::Schema.define(version: 20140507013447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocs", force: true do |t|
    t.string   "name"
    t.text     "code"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "img_url"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "designer"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "web_layouts", force: true do |t|
    t.integer  "bloc_id"
    t.integer  "webpage_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "web_layouts", ["bloc_id"], name: "index_web_layouts_on_bloc_id", using: :btree
  add_index "web_layouts", ["webpage_id"], name: "index_web_layouts_on_webpage_id", using: :btree

  create_table "webpages", force: true do |t|
    t.string   "name"
    t.integer  "bloc_id",    array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

end
