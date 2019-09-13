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

ActiveRecord::Schema.define(version: 2019_09_04_075949) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "groupmessages", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "group_id"
    t.string "message", limit: 1000
    t.integer "user_id"
    t.string "attachment"
    t.boolean "unread"
    t.boolean "favourite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "favouritebyuserid"
    t.index ["group_id"], name: "index_groupmessages_on_group_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "types"
    t.bigint "workspace_id"
    t.integer "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workspace_id"], name: "index_groups_on_workspace_id"
  end

  create_table "groups_users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_groups_users_on_group_id"
    t.index ["user_id"], name: "index_groups_users_on_user_id"
  end

  create_table "groupthreadmessages", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "message"
    t.bigint "groupmessage_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groupmessage_id"], name: "index_groupthreadmessages_on_groupmessage_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "picture"
    t.integer "role"
    t.integer "currentworkspace"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_workspaces", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "workspace_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_users_workspaces_on_user_id"
    t.index ["workspace_id"], name: "index_users_workspaces_on_workspace_id"
  end

  create_table "workspaceinvites", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "email"
    t.boolean "confirm"
    t.bigint "workspace_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workspace_id"], name: "index_workspaceinvites_on_workspace_id"
  end

  create_table "workspaces", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.integer "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "groupmessages", "groups"
  add_foreign_key "groups", "workspaces"
  add_foreign_key "groups_users", "groups"
  add_foreign_key "groups_users", "users"
  add_foreign_key "groupthreadmessages", "groupmessages"
  add_foreign_key "users_workspaces", "users"
  add_foreign_key "users_workspaces", "workspaces"
  add_foreign_key "workspaceinvites", "workspaces"
end
