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

ActiveRecord::Schema.define(version: 20170119132225) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "owner"
    t.string   "state"
    t.integer  "number_sprints"
    t.text     "details"
    t.string   "sprints"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "user_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.datetime "begin_sprint"
    t.datetime "end_sprint"
    t.integer  "hours"
    t.integer  "number_tasks"
    t.integer  "num_compromised_points"
    t.string   "state"
    t.integer  "completed_tasks"
    t.integer  "completed_points"
    t.integer  "defects_found"
    t.string   "owner_sprint"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "name"
    t.index ["project_id"], name: "index_sprints_on_project_id"
    t.index ["user_id"], name: "index_sprints_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "type_task"
    t.integer  "user_id"
    t.integer  "sprint_id"
    t.datetime "dev_start_time"
    t.datetime "dev_end_time"
    t.datetime "qa_start_time"
    t.datetime "qa_end_time"
    t.string   "state_task"
    t.integer  "project_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "to_do_start_time"
    t.datetime "to_do_end_time"
    t.datetime "done_time"
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["sprint_id"], name: "index_tasks_on_sprint_id"
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "superadmin_role"
    t.boolean  "admin_role"
    t.boolean  "user_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
