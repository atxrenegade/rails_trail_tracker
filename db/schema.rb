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

ActiveRecord::Schema.define(version: 2019_04_19_051405) do

  create_table "hikes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "trail_id"
    t.string "date_of_hike"
    t.text "comments"
    t.boolean "is_public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trail_id"], name: "index_hikes_on_trail_id"
    t.index ["user_id"], name: "index_hikes_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.string "date"
    t.string "description"
    t.boolean "is_public"
    t.string "username"
    t.string "trail_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "imageable_type"
    t.integer "imageable_id"
    t.index ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.string "difficulty_rating"
    t.string "description"
    t.string "start_point"
    t.string "end_point"
    t.string "length_of_hike"
    t.string "terrain"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "uid"
  end
end
