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

ActiveRecord::Schema.define(version: 20150326051557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.string   "assessment_name"
    t.date     "assessment_date"
    t.string   "overhead_squat"
    t.string   "single_leg_squat"
    t.decimal  "right_hip_strength"
    t.decimal  "left_hip_strength"
    t.string   "shoulder_mobility"
    t.string   "right_glute_activation"
    t.string   "left_glute_activation"
    t.decimal  "plank"
    t.decimal  "right_plank"
    t.decimal  "left_plank"
    t.string   "leg_lowering"
    t.string   "push_up"
    t.string   "blood_pressure"
    t.integer  "weight"
    t.string   "height"
    t.integer  "client_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "bmi"
    t.string   "heart_rate"
    t.string   "body_fat_percentage"
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "member_id"
    t.datetime "date_of_birth"
    t.string   "emergency_contact"
    t.string   "emergency_number"
    t.text     "additional_info"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "food_logs", force: :cascade do |t|
    t.datetime "date"
    t.string   "breakfast"
    t.string   "mid_morning_snack"
    t.string   "lunch"
    t.string   "afternoon_snack"
    t.string   "dinner"
    t.string   "after_dinner"
    t.string   "drinks"
    t.text     "client_coments"
    t.text     "trainer_feedback"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "target_date"
    t.string   "goal_name"
    t.text     "goals"
    t.boolean  "completed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "workouts", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.text     "workout"
    t.text     "comments"
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
