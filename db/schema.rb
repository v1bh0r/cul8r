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

ActiveRecord::Schema.define(:version => 20120610103838) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "genres", :force => true do |t|
    t.string  "name"
    t.integer "rank", :default => 1
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
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
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
    t.boolean  "is_dvd_available"
    t.boolean  "suppressed",                 :default => false
    t.string   "slug"
  end

  add_index "movies", ["md_ref_id"], :name => "index_movies_on_md_ref_id"
  add_index "movies", ["movie_database_provider_id"], :name => "idx_mov_provider"
  add_index "movies", ["name", "year"], :name => "index_movies_on_name_and_year"
  add_index "movies", ["name"], :name => "index_movies_on_name"
  add_index "movies", ["slug"], :name => "index_movies_on_slug", :unique => true
  add_index "movies", ["year"], :name => "index_movies_on_year"

  create_table "movies_genres", :force => true do |t|
    t.integer "movie_id"
    t.integer "genre_id"
  end

  add_index "movies_genres", ["genre_id"], :name => "index_movies_genres_on_genre_id"
  add_index "movies_genres", ["movie_id", "genre_id"], :name => "index_movies_genres_on_movie_id_and_genre_id", :unique => true
  add_index "movies_genres", ["movie_id"], :name => "index_movies_genres_on_movie_id"

  create_table "notifications", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.boolean  "is_read",    :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "notifications", ["user_id"], :name => "index_notifications_on_user_id"

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

  create_table "watch_list_movie_entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "watch_list_movie_entries", ["movie_id"], :name => "index_watch_list_movie_entries_on_movie_id"
  add_index "watch_list_movie_entries", ["user_id"], :name => "idx_watch_list_user"

end
