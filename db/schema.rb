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

ActiveRecord::Schema.define(version: 2020_08_02_172100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.bigint "opcao_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["opcao_id"], name: "index_choices_on_opcao_id"
    t.index ["user_id"], name: "index_choices_on_user_id"
  end

  create_table "enquetes", force: :cascade do |t|
    t.string "titulo"
    t.string "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "opcaos", force: :cascade do |t|
    t.string "nome"
    t.integer "pontos"
    t.bigint "enquete_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enquete_id"], name: "index_opcaos_on_enquete_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votos", force: :cascade do |t|
    t.boolean "opcao1"
    t.boolean "opcao2"
    t.boolean "opcao3"
    t.boolean "opcao4"
    t.boolean "opcao5"
    t.boolean "opcao6"
    t.boolean "opcao7"
    t.boolean "opcao8"
    t.boolean "opcao9"
    t.boolean "opcao10"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "choices", "opcaos"
  add_foreign_key "choices", "users"
  add_foreign_key "opcaos", "enquetes"
end
