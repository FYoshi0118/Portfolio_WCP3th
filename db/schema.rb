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

ActiveRecord::Schema.define(version: 20180711115939) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.boolean "is_main_administer", default: false, null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["family_name"], name: "index_admins_on_family_name"
    t.index ["given_name"], name: "index_admins_on_given_name"
    t.index ["is_deleted"], name: "index_admins_on_is_deleted"
    t.index ["is_main_administer"], name: "index_admins_on_is_main_administer"
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name", null: false
    t.string "post_code", limit: 7
    t.string "address"
    t.string "phone_number", limit: 11
    t.string "email"
    t.string "url"
    t.boolean "is_confirmed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_breweries_on_address"
    t.index ["is_confirmed"], name: "index_breweries_on_is_confirmed"
    t.index ["name"], name: "index_breweries_on_name"
    t.index ["phone_number"], name: "index_breweries_on_phone_number"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sake_id", null: false
    t.text "content", null: false
    t.text "image_id"
    t.integer "star", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content"], name: "index_posts_on_content"
    t.index ["sake_id"], name: "index_posts_on_sake_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "sakes", force: :cascade do |t|
    t.integer "brewery_id", null: false
    t.string "brand", null: false
    t.string "specially_designated"
    t.string "recipe"
    t.string "flavor"
    t.float "nihonshudo"
    t.float "acidity"
    t.boolean "is_confirmed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acidity"], name: "index_sakes_on_acidity"
    t.index ["brand"], name: "index_sakes_on_brand"
    t.index ["brewery_id"], name: "index_sakes_on_brewery_id"
    t.index ["flavor"], name: "index_sakes_on_flavor"
    t.index ["is_confirmed"], name: "index_sakes_on_is_confirmed"
    t.index ["nihonshudo"], name: "index_sakes_on_nihonshudo"
    t.index ["recipe"], name: "index_sakes_on_recipe"
    t.index ["specially_designated"], name: "index_sakes_on_specially_designated"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name_code", null: false
    t.string "nickname", null: false
    t.string "birthday"
    t.integer "status", default: 0, null: false
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["birthday"], name: "index_users_on_birthday"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name_code"], name: "index_users_on_name_code"
    t.index ["nickname"], name: "index_users_on_nickname"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["status"], name: "index_users_on_status"
  end

end
