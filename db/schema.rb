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

ActiveRecord::Schema.define(version: 20170323152456) do

  create_table "attendees", force: :cascade do |t|
    t.string   "name"
    t.boolean  "child"
    t.boolean  "welcome_dinner"
    t.string   "yoga"
    t.boolean  "reception_dinner"
    t.boolean  "vegan"
    t.string   "food_restrictions"
    t.integer  "guest_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "unable_to_attend"
    t.index ["guest_id", "updated_at"], name: "index_attendees_on_guest_id_and_updated_at"
    t.index ["guest_id"], name: "index_attendees_on_guest_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_guests_on_email", unique: true
  end

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "title"
    t.integer  "guest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_songs_on_guest_id"
  end

end
