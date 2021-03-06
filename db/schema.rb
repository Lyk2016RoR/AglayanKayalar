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

ActiveRecord::Schema.define(version: 20160819122204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acomments", force: :cascade do |t|
    t.text     "body"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_acomments_on_author_id", using: :btree
    t.index ["user_id"], name: "index_acomments_on_user_id", using: :btree
  end

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bcomments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.text     "body"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_bcomments_on_book_id", using: :btree
    t.index ["user_id"], name: "index_bcomments_on_user_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "page_count"
    t.date     "publication_year"
    t.integer  "ISBN"
    t.integer  "category_id"
    t.integer  "author_id"
    t.integer  "publisher_id"
    t.integer  "interpreter_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["author_id"], name: "index_books_on_author_id", using: :btree
    t.index ["category_id"], name: "index_books_on_category_id", using: :btree
    t.index ["interpreter_id"], name: "index_books_on_interpreter_id", using: :btree
    t.index ["publisher_id"], name: "index_books_on_publisher_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editors", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_editors_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_editors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "interpreters", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "okunmuspirincs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_okunmuspirincs_on_book_id", using: :btree
    t.index ["user_id"], name: "index_okunmuspirincs_on_user_id", using: :btree
  end

  create_table "publishers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_wishlists_on_book_id", using: :btree
    t.index ["user_id"], name: "index_wishlists_on_user_id", using: :btree
  end

  add_foreign_key "acomments", "authors"
  add_foreign_key "acomments", "users"
  add_foreign_key "bcomments", "books"
  add_foreign_key "bcomments", "users"
  add_foreign_key "books", "authors"
  add_foreign_key "books", "categories"
  add_foreign_key "books", "interpreters"
  add_foreign_key "books", "publishers"
  add_foreign_key "okunmuspirincs", "books"
  add_foreign_key "okunmuspirincs", "users"
  add_foreign_key "wishlists", "books"
  add_foreign_key "wishlists", "users"
end
