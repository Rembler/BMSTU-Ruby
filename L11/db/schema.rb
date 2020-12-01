# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_01_080501) do

  create_table "results", force: :cascade do |t|
    t.integer "val1"
    t.integer "val2"
    t.integer "gcf"
    t.integer "lcm"
    t.text "st"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["val1"], name: "index_results_on_val1", unique: true
    t.index ["val2"], name: "index_results_on_val2", unique: true
  end

end
