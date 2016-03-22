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

ActiveRecord::Schema.define(version: 20160101152512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "Instagram", id: :bigserial, force: :cascade do |t|
    t.integer  "media_id",  limit: 8
    t.datetime "created"
    t.text     "link"
    t.text     "image"
    t.integer  "likes"
    t.text     "text"
    t.integer  "comments"
    t.integer  "user_id"
    t.text     "user"
    t.text     "location"
    t.text     "latitude"
    t.text     "longitude"
  end

  create_table "Instagram_Restaurant", force: :cascade do |t|
    t.integer "instagram_id"
    t.integer "restaurant_id"
  end

  create_table "Location", force: :cascade do |t|
    t.text      "name"
    t.text      "address"
    t.geography "coordinate", limit: {:srid=>4326, :type=>"point", :geographic=>true}
  end

  add_index "Location", ["coordinate"], name: "index_Location_on_coordinate", using: :gist

  create_table "Restaurant", force: :cascade do |t|
    t.text    "name"
    t.integer "location_id"
    t.integer "count"
    t.float   "score"
  end

  create_table "test", force: :cascade do |t|
    t.string "title"
  end

end
