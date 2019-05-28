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

ActiveRecord::Schema.define(version: 20190528194542) do

  create_table "owners", force: :cascade do |t|
    t.string  "name"
    t.integer "zip_code"
    t.string  "kind"
  end

  create_table "pet_owners", force: :cascade do |t|
    t.integer "pet_id"
    t.integer "owner_id"
    t.boolean "current?"
  end

  create_table "pets", force: :cascade do |t|
    t.string  "name"
    t.string  "breed"
    t.integer "age"
    t.string  "status"
    t.string  "color"
    t.string  "size"
    t.integer "fee"
    t.string  "bio"
    t.string  "gender"
    t.string  "species"
  end

end
