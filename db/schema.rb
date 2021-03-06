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

ActiveRecord::Schema.define(version: 2019_03_04_232440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "day_of_week"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "geo_addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "geo_state_id"
    t.bigint "geo_country_id"
    t.integer "status"
    t.text "hash_code"
    t.string "address_type"
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "street"
    t.string "street2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.float "latitude"
    t.float "longitude"
    t.boolean "validated", default: false
    t.boolean "preferred", default: false
    t.boolean "valid_to_ship", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_country_id", "geo_state_id"], name: "index_geo_addresses_on_geo_country_id_and_geo_state_id"
    t.index ["geo_country_id"], name: "index_geo_addresses_on_geo_country_id"
    t.index ["geo_state_id"], name: "index_geo_addresses_on_geo_state_id"
    t.index ["hash_code"], name: "index_geo_addresses_on_hash_code"
    t.index ["user_id"], name: "index_geo_addresses_on_user_id"
  end

  create_table "geo_countries", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geo_states", force: :cascade do |t|
    t.bigint "geo_country_id"
    t.string "name"
    t.string "abbrev"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_country_id"], name: "index_geo_states_on_geo_country_id"
  end

  create_table "identifiers", force: :cascade do |t|
    t.string "parent_obj_type"
    t.bigint "parent_obj_id"
    t.string "provider"
    t.string "label"
    t.string "identifier"
    t.hstore "properties", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identifier", "provider", "label"], name: "index_identifiers_on_identifier_and_provider_and_label", unique: true
    t.index ["parent_obj_type", "parent_obj_id"], name: "index_identifiers_on_parent_obj_type_and_parent_obj_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "user_id"
    t.date "workout_date"
    t.text "workout"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "oauth_credentials", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "refresh_token"
    t.string "secret"
    t.datetime "expires_at"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider"], name: "index_oauth_credentials_on_provider"
    t.index ["secret"], name: "index_oauth_credentials_on_secret"
    t.index ["token"], name: "index_oauth_credentials_on_token"
    t.index ["uid"], name: "index_oauth_credentials_on_uid"
    t.index ["user_id"], name: "index_oauth_credentials_on_user_id"
  end

  create_table "promos", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.text "content"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pulitzer_categories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "parent_id"
    t.string "name"
    t.string "type"
    t.integer "lft"
    t.integer "rgt"
    t.text "description"
    t.string "avatar"
    t.string "cover_image"
    t.integer "status", default: 1
    t.integer "availability", default: 1
    t.integer "seq"
    t.string "slug"
    t.hstore "properties", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lft"], name: "index_pulitzer_categories_on_lft"
    t.index ["parent_id"], name: "index_pulitzer_categories_on_parent_id"
    t.index ["rgt"], name: "index_pulitzer_categories_on_rgt"
    t.index ["slug"], name: "index_pulitzer_categories_on_slug", unique: true
    t.index ["type"], name: "index_pulitzer_categories_on_type"
    t.index ["user_id"], name: "index_pulitzer_categories_on_user_id"
  end

  create_table "pulitzer_media", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "managed_by_id"
    t.string "public_id"
    t.bigint "category_id"
    t.bigint "working_media_version_id"
    t.bigint "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.string "type"
    t.string "media_type"
    t.string "sub_type"
    t.string "title"
    t.string "subtitle"
    t.text "avatar"
    t.string "cover_image"
    t.string "avatar_caption"
    t.string "layout"
    t.string "template"
    t.text "description"
    t.text "meta_description"
    t.text "content"
    t.string "slug"
    t.string "redirect_url"
    t.boolean "is_commentable", default: true
    t.boolean "is_sticky", default: false
    t.boolean "show_title", default: true
    t.datetime "modified_at"
    t.text "keywords", default: [], array: true
    t.text "tags", default: [], array: true
    t.string "duration"
    t.integer "cached_char_count", default: 0
    t.integer "cached_word_count", default: 0
    t.integer "status", default: 1
    t.integer "availability", default: 1
    t.datetime "publish_at"
    t.hstore "properties", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_pulitzer_media_on_category_id"
    t.index ["managed_by_id"], name: "index_pulitzer_media_on_managed_by_id"
    t.index ["parent_id"], name: "index_pulitzer_media_on_parent_id"
    t.index ["public_id"], name: "index_pulitzer_media_on_public_id"
    t.index ["slug", "type"], name: "index_pulitzer_media_on_slug_and_type"
    t.index ["slug"], name: "index_pulitzer_media_on_slug", unique: true
    t.index ["status", "availability"], name: "index_pulitzer_media_on_status_and_availability"
    t.index ["tags"], name: "index_pulitzer_media_on_tags", using: :gin
    t.index ["user_id"], name: "index_pulitzer_media_on_user_id"
    t.index ["working_media_version_id"], name: "index_pulitzer_media_on_working_media_version_id"
  end

  create_table "pulitzer_media_versions", force: :cascade do |t|
    t.bigint "media_id"
    t.bigint "user_id"
    t.integer "status", default: 1
    t.json "versioned_attributes", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["media_id", "id"], name: "index_pulitzer_media_versions_on_media_id_and_id"
    t.index ["media_id", "status", "id"], name: "index_pulitzer_media_versions_on_media_id_and_status_and_id"
    t.index ["media_id"], name: "index_pulitzer_media_versions_on_media_id"
    t.index ["user_id"], name: "index_pulitzer_media_versions_on_user_id"
  end

  create_table "scuttlebutt_messages", force: :cascade do |t|
    t.bigint "recipient_id"
    t.bigint "sender_id"
    t.string "title"
    t.text "content"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id", "status"], name: "index_scuttlebutt_messages_on_recipient_id_and_status"
    t.index ["recipient_id"], name: "index_scuttlebutt_messages_on_recipient_id"
    t.index ["sender_id"], name: "index_scuttlebutt_messages_on_sender_id"
  end

  create_table "scuttlebutt_notifications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "actor_id"
    t.string "parent_obj_type"
    t.bigint "parent_obj_id"
    t.string "activity_obj_type"
    t.bigint "activity_obj_id"
    t.string "title"
    t.text "content"
    t.integer "status", default: 1
    t.integer "parent_id"
    t.integer "lft", null: false
    t.integer "rgt", null: false
    t.integer "seq"
    t.integer "children_count", default: 0, null: false
    t.string "action"
    t.datetime "publish_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action", "children_count", "status", "created_at"], name: "idx_notifications_action_count_status"
    t.index ["action", "children_count", "status", "parent_obj_type", "created_at", "parent_obj_id"], name: "idx_notifications_action_count_status_parent_obj"
    t.index ["activity_obj_id", "activity_obj_type", "user_id", "parent_obj_id", "parent_obj_type"], name: "idx_notifications_on_activity"
    t.index ["activity_obj_type", "activity_obj_id"], name: "idx_notifications_on_act_obj"
    t.index ["actor_id"], name: "index_scuttlebutt_notifications_on_actor_id"
    t.index ["lft"], name: "index_scuttlebutt_notifications_on_lft"
    t.index ["parent_id"], name: "index_scuttlebutt_notifications_on_parent_id"
    t.index ["parent_obj_type", "parent_obj_id"], name: "idx_notifications_on_par_obj"
    t.index ["rgt"], name: "index_scuttlebutt_notifications_on_rgt"
    t.index ["user_id", "action", "children_count", "status", "created_at"], name: "idx_notifications_user_action_count_status"
    t.index ["user_id", "action", "children_count", "status", "parent_obj_type", "created_at", "parent_obj_id"], name: "idx_notifications_user_action_count_status_parent_obj"
    t.index ["user_id", "created_at", "status"], name: "idx_notifications_on_user"
    t.index ["user_id", "parent_obj_id", "parent_obj_type"], name: "idx_notifications_on_parent"
    t.index ["user_id"], name: "index_scuttlebutt_notifications_on_user_id"
  end

  create_table "scuttlebutt_posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "parent_obj_type"
    t.bigint "parent_obj_id"
    t.bigint "reply_to_id"
    t.integer "lft"
    t.integer "rgt"
    t.string "type"
    t.string "slug"
    t.string "subject"
    t.text "content"
    t.integer "rating"
    t.boolean "sticky", default: false
    t.integer "seq"
    t.bigint "cached_vote_count", default: 0
    t.float "cached_vote_score", default: 0.0
    t.bigint "cached_upvote_count", default: 0
    t.bigint "cached_downvote_count", default: 0
    t.integer "cached_subscribe_count", default: 0
    t.integer "cached_impression_count", default: 0
    t.float "computed_score", default: 0.0
    t.integer "status", default: 1
    t.integer "availability", default: 1
    t.datetime "modified_at"
    t.hstore "properties"
    t.string "tags", default: [], array: true
    t.string "mentions", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "sanitized_content"
    t.index ["created_at", "mentions"], name: "index_scuttlebutt_posts_on_created_at_and_mentions"
    t.index ["mentions"], name: "index_scuttlebutt_posts_on_mentions", using: :gin
    t.index ["parent_obj_type", "parent_obj_id"], name: "idx_posts_on_par_obj"
    t.index ["reply_to_id"], name: "index_scuttlebutt_posts_on_reply_to_id"
    t.index ["slug"], name: "index_scuttlebutt_posts_on_slug", unique: true
    t.index ["tags"], name: "index_scuttlebutt_posts_on_tags", using: :gin
    t.index ["updated_at", "mentions"], name: "index_scuttlebutt_posts_on_updated_at_and_mentions"
    t.index ["user_id", "parent_obj_id", "parent_obj_type"], name: "idx_user_posts_on_parent"
    t.index ["user_id"], name: "index_scuttlebutt_posts_on_user_id"
  end

  create_table "scuttlebutt_subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "parent_obj_type"
    t.bigint "parent_obj_id"
    t.bigint "category_id"
    t.string "format", default: "site"
    t.text "notification_contexts", default: [], array: true
    t.integer "status", default: 1
    t.integer "availability", default: 1
    t.hstore "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_scuttlebutt_subscriptions_on_category_id"
    t.index ["parent_obj_type", "parent_obj_id"], name: "idx_subs_on_par_obj"
    t.index ["user_id", "parent_obj_id", "parent_obj_type"], name: "idx_subs_on_parent"
    t.index ["user_id"], name: "index_scuttlebutt_subscriptions_on_user_id"
  end

  create_table "scuttlebutt_votes", force: :cascade do |t|
    t.string "parent_obj_type"
    t.bigint "parent_obj_id"
    t.bigint "user_id"
    t.integer "val", default: 0
    t.string "vote_type"
    t.string "context", default: "vote"
    t.text "content"
    t.hstore "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_obj_id", "parent_obj_type", "context"], name: "idx_votes_on_parent_context"
    t.index ["parent_obj_type", "parent_obj_id"], name: "idx_votes_on_par_obj"
    t.index ["user_id", "context"], name: "idx_votes_on_user_context"
    t.index ["user_id", "parent_obj_id", "parent_obj_type"], name: "idx_votes_on_parent"
    t.index ["user_id"], name: "index_scuttlebutt_votes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "slug"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.datetime "dob"
    t.string "gender"
    t.integer "status", default: 1
    t.integer "role", default: 1
    t.integer "level", default: 1
    t.string "website_url"
    t.text "bio"
    t.string "ip"
    t.string "ip_country"
    t.string "timezone", default: "Pacific Time (US & Canada)"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "password_hint"
    t.string "password_hint_response"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "authentication_token"
    t.text "tags", default: [], array: true
    t.hstore "properties", default: {}
    t.hstore "settings", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  create_table "waivers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.date "dob"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "email"
    t.string "emergency_contact_name"
    t.string "emergency_contact_phone"
    t.boolean "heart_condition"
    t.boolean "chest_pain_doing_activity"
    t.boolean "chest_pain_without_doing_activity"
    t.boolean "lose_balance"
    t.boolean "bone_problem"
    t.boolean "prescription_drugs"
    t.boolean "other_reason_not_to_do_activity"
    t.string "signature"
    t.date "sign_date"
    t.string "legal_guardian_name"
    t.string "legal_guardian_signature"
    t.date "legal_guardian_sign_date"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_waivers_on_user_id"
  end

  add_foreign_key "contacts", "users"
end
