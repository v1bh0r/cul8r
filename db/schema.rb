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

ActiveRecord::Schema.define(:version => 20120422073318) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "movie_database_providers", :force => true do |t|
    t.string "name"
  end

  create_table "movies", :force => true do |t|
    t.string   "name"
    t.string   "alt_name"
    t.integer  "popularity"
    t.float    "rating"
    t.float    "imdb_rating"
    t.string   "imdb_id"
    t.text     "overview"
    t.string   "image_url"
    t.string   "url"
    t.string   "trailer_url"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "year"
    t.text     "rotten_tomatoes_info"
    t.integer  "movie_database_provider_id", :default => 1
    t.string   "md_ref_id"
    t.string   "critics_rating"
    t.integer  "critics_score"
    t.text     "synopsis"
    t.string   "poster_thumbnail"
    t.string   "poster_profile"
    t.string   "poster_detailed"
    t.string   "poster_original"
    t.text     "abridged_cast"
    t.date     "release_dates"
  end

  add_index "movies", ["md_ref_id"], :name => "index_movies_on_md_ref_id"
  add_index "movies", ["movie_database_provider_id"], :name => "idx_mov_provider"
  add_index "movies", ["name", "year"], :name => "index_movies_on_name_and_year"
  add_index "movies", ["name"], :name => "index_movies_on_name"
  add_index "movies", ["year"], :name => "index_movies_on_year"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

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
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
