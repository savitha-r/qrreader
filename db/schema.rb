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

ActiveRecord::Schema.define(version: 20131213082846) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "verified",          default: false
    t.boolean  "banned",            default: false
    t.boolean  "published",         default: false
    t.string   "email"
    t.string   "address"
    t.string   "fax"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone2"
    t.string   "postal_code"
    t.integer  "user_id"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "department_employees", force: true do |t|
    t.integer  "department_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "department_employees", ["department_id"], name: "index_department_employees_on_department_id"
  add_index "department_employees", ["employee_id"], name: "index_department_employees_on_employee_id"

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments", ["company_id"], name: "index_departments_on_company_id"

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "mobile"
    t.string   "office_phone"
    t.string   "fax"
    t.string   "title"
    t.string   "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "urls"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["company_id"], name: "index_employees_on_company_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "role"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
