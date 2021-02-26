# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_26_163104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "biz"
    t.string "email"
    t.string "tel"
    t.string "adr"
    t.string "cty"
    t.string "ste"
    t.string "zip"
    t.string "web_type"
    t.string "hosting_type"
    t.string "security_type"
    t.string "date_started"
    t.string "date_completed"
    t.string "order_total"
    t.string "ongoing_total"
    t.string "due_date"
    t.string "domain_name"
    t.string "ip_adr"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
