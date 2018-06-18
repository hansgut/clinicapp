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

ActiveRecord::Schema.define(version: 20180608102420) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_chatrooms_on_doctor_id"
    t.index ["user_id"], name: "index_chatrooms_on_user_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.boolean "is_female", default: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "last_seen"
    t.bigint "specialty_id"
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
    t.index ["specialty_id"], name: "index_doctors_on_specialty_id"
  end

  create_table "heals", force: :cascade do |t|
    t.string "content"
    t.bigint "doctor_id"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_heals_on_doctor_id"
    t.index ["list_id"], name: "index_heals_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.boolean "is_female"
    t.integer "age"
    t.datetime "date_start"
    t.string "label"
    t.string "work"
    t.datetime "date_finish"
    t.boolean "is_close"
    t.string "conclusion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "disease_id"
    t.bigint "doctor_id"
    t.index ["disease_id"], name: "index_lists_on_disease_id"
    t.index ["doctor_id"], name: "index_lists_on_doctor_id"
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.bigint "chatroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender"
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["doctor_id"], name: "index_messages_on_doctor_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.bigint "disease_id"
    t.text "complaints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "doctor_id"
    t.index ["disease_id"], name: "index_treatments_on_disease_id"
    t.index ["doctor_id"], name: "index_treatments_on_doctor_id"
    t.index ["user_id"], name: "index_treatments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.datetime "date_of_birth"
    t.string "last_name"
    t.string "patronymic"
    t.boolean "is_female", default: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "last_seen"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chatrooms", "doctors"
  add_foreign_key "chatrooms", "users"
  add_foreign_key "doctors", "specialties"
  add_foreign_key "heals", "doctors"
  add_foreign_key "heals", "lists"
  add_foreign_key "lists", "diseases"
  add_foreign_key "lists", "doctors"
  add_foreign_key "lists", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "doctors"
  add_foreign_key "messages", "users"
  add_foreign_key "treatments", "diseases"
  add_foreign_key "treatments", "doctors"
  add_foreign_key "treatments", "users"
end
