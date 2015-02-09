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

ActiveRecord::Schema.define(version: 20_141_113_224_059) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'authorizations', force: true do |t|
    t.string 'provider'
    t.string 'uid'
    t.integer 'user_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'events', force: true do |t|
    t.string 'title'
    t.text 'description'
    t.integer 'group_id'
    t.integer 'user_id'
    t.boolean 'visible',       default: true
    t.datetime 'event_at'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.text 'location'
    t.datetime 'starts_at'
    t.datetime 'ends_at'
    t.integer 'reports_count'
    t.string 'address_1'
    t.string 'address_2'
  end

  add_index 'events', ['group_id'], name: 'index_events_on_group_id', using: :btree
  add_index 'events', ['user_id'], name: 'index_events_on_user_id', using: :btree

  create_table 'groups', force: true do |t|
    t.string 'name'
    t.string 'acronym'
    t.text 'description'
    t.boolean 'restricted',  default: false
    t.boolean 'visible',     default: true
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.integer 'user_id'
    t.string 'url'
  end

  create_table 'memberships', force: true do |t|
    t.integer 'user_id'
    t.string 'email'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'reports', force: true do |t|
    t.integer 'event_id'
    t.integer 'user_id'
    t.text 'reason'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'users', force: true do |t|
    t.string 'name'
    t.string 'email'
    t.string 'avatar'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.boolean 'banned',     default: false
  end
end
