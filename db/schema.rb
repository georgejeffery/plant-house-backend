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

ActiveRecord::Schema.define(version: 2019_03_04_093454) do

  create_table "plants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latin_name"
    t.string "plant_habit"
    t.string "life_cycle"
    t.string "sun_requirements"
    t.string "water_preferences"
    t.string "minimum_cold_hardiness"
    t.string "maximum_recommended_zone"
    t.string "plant_height"
    t.string "plant_spread"
    t.string "leaves"
    t.string "flowers"
    t.string "bloom_size"
    t.string "underground_structures"
    t.string "suitable_locations"
    t.string "resistances"
    t.string "propagation"
    t.string "containers"
    t.string "flower_color"
    t.string "flower_time"
    t.string "wildlife_attractant"
    t.string "image_url"
    t.string "soil_ph_preferences"
    t.string "fruit"
    t.string "commonname"
  end

  create_table "room_plants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.integer "plant_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "user_id"
    t.string "light"
    t.integer "temperature"
    t.string "humidity"
    t.boolean "flowers"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
