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

ActiveRecord::Schema.define(version: 20140206213554) do

  create_table "aramis_entities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_code_id"
  end

  create_table "collaborators", force: true do |t|
    t.string   "prenom"
    t.string   "nom"
    t.string   "id_karma"
    t.string   "role"
    t.string   "email"
    t.string   "etat"
    t.string   "statut"
    t.string   "niv_diplome"
    t.string   "nat_diplome"
    t.integer  "entity_id"
    t.integer  "manager_id"
    t.text     "commentaire"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profil"
    t.string   "eligibilite"
    t.integer  "aramis_entity_id"
  end

  create_table "domains", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "responsable_id"
  end

  create_table "entities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manager_id"
  end

  create_table "lists", force: true do |t|
    t.integer  "entity_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_codes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "domain_id"
    t.integer  "chef_id"
    t.integer  "maitrise_ouvrage_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  create_table "proposals", force: true do |t|
    t.integer  "consultant_id"
    t.date     "date"
    t.integer  "nbre_jour"
    t.string   "etat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "list_id"
    t.integer  "project_id"
    t.integer  "entity_id"
  end

  create_table "requests", force: true do |t|
    t.integer  "project_id"
    t.integer  "consultant_id"
    t.date     "date"
    t.string   "etat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "proposal_id"
  end

end
