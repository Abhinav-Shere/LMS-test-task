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

ActiveRecord::Schema[8.0].define(version: 2025_07_21_071111) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "courses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_records", force: :cascade do |t|
    t.string "aggregate_id", null: false
    t.integer "sequence_number", null: false
    t.string "event_type", null: false
    t.text "event_json", null: false
    t.string "created_by"
    t.datetime "created_at", null: false
    t.index ["aggregate_id", "sequence_number"], name: "index_event_records_on_aggregate_id_and_sequence_number", unique: true
  end

  create_table "lesson_completions", force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "lesson_id"
    t.boolean "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "aggregate_id", null: false
    t.uuid "course_id", null: false
    t.string "title"
    t.text "content"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "snapshot_records", force: :cascade do |t|
    t.string "aggregate_id", null: false
    t.integer "sequence_number", null: false
    t.text "snapshot", null: false
    t.datetime "created_at", null: false
    t.index ["aggregate_id", "sequence_number"], name: "index_snapshot_records_on_aggregate_id_and_sequence_number", unique: true
  end

  create_table "stream_records", force: :cascade do |t|
    t.string "aggregate_type", null: false
    t.string "aggregate_id", null: false
    t.integer "snapshot_threshold", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aggregate_type", "aggregate_id"], name: "index_stream_records_on_aggregate_type_and_aggregate_id", unique: true
  end

  add_foreign_key "lessons", "courses"
end
