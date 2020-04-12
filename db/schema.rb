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

ActiveRecord::Schema.define(version: 2020_04_12_065810) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.integer "question_id"
    t.integer "position"
    t.boolean "is_end", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "kakao_apis", force: :cascade do |t|
    t.text "input_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "bot_name"
    t.string "intent_name"
    t.index ["user_id"], name: "index_kakao_apis_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body"
    t.integer "position"
    t.integer "symptom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["symptom_id"], name: "index_questions_on_symptom_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.integer "s_id"
    t.text "first_aids"
    t.string "species_name"
    t.string "symptom_name"
    t.text "symptom_details"
    t.integer "result", default: 0
    t.text "cause"
  end

  create_table "species", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name"
    t.integer "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_symptoms_on_species_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "bot_user_key"
    t.string "plusfriend_user_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bot_user_key"], name: "index_users_on_bot_user_key"
    t.index ["plusfriend_user_key"], name: "index_users_on_plusfriend_user_key"
  end

end
