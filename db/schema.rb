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

ActiveRecord::Schema.define(version: 20180402183232) do

  create_table "containers", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_tag", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "tag_id"
    t.index ["item_id"], name: "index_item_tag_on_item_id"
    t.index ["tag_id"], name: "index_item_tag_on_tag_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.string "description"
    t.string "reciept_picture"
    t.integer "qty"
    t.integer "min"
    t.integer "max"
    t.integer "value"
    t.integer "uid"
    t.datetime "obtained_date"
    t.datetime "loaned_date"
    t.boolean "loaned"
    t.integer "user_id"
    t.integer "storage_location_id"
    t.integer "section_id"
    t.integer "subsection_id"
    t.integer "container_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["container_id"], name: "index_items_on_container_id"
    t.index ["section_id"], name: "index_items_on_section_id"
    t.index ["storage_location_id"], name: "index_items_on_storage_location_id"
    t.index ["subsection_id"], name: "index_items_on_subsection_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "section_subsection", id: false, force: :cascade do |t|
    t.integer "section_id"
    t.integer "subsection_id"
    t.index ["section_id"], name: "index_section_subsection_on_section_id"
    t.index ["subsection_id"], name: "index_section_subsection_on_subsection_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storage_location_section", id: false, force: :cascade do |t|
    t.integer "storage_location_id"
    t.integer "section_id"
    t.index ["section_id"], name: "index_storage_location_section_on_section_id"
    t.index ["storage_location_id"], name: "index_storage_location_section_on_storage_location_id"
  end

  create_table "storage_locations", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_storage_locations_on_user_id"
  end

  create_table "subsection_container", id: false, force: :cascade do |t|
    t.integer "subection_id"
    t.integer "container_id"
    t.index ["container_id"], name: "index_subsection_container_on_container_id"
    t.index ["subection_id"], name: "index_subsection_container_on_subection_id"
  end

  create_table "subsections", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
