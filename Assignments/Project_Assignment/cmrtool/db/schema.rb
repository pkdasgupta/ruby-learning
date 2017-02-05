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

ActiveRecord::Schema.define(version: 20160723061309) do

  create_table "changes", force: :cascade do |t|
    t.string   "title"
    t.string   "jira"
    t.text     "purpose"
    t.datetime "start_time"
    t.float    "lead_time"
    t.text     "target"
    t.string   "pic"
    t.text     "service_impact"
    t.text     "delay_cause"
    t.string   "result"
    t.text     "rollback_cause"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
