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

ActiveRecord::Schema.define(version: 20150730013745) do

  create_table "comment_votes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "comment_id", limit: 4, null: false
    t.integer  "vote_value", limit: 4, null: false
    t.datetime "created_at",           null: false
  end

  add_index "comment_votes", ["user_id", "comment_id"], name: "index_comment_votes_on_user_id_and_comment_id", unique: true, using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.text     "body",             limit: 65535
    t.integer  "user_id",          limit: 4
    t.integer  "parent_id",        limit: 4
    t.integer  "lft",              limit: 4
    t.integer  "rgt",              limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_deleted",                     default: false
    t.boolean  "is_rewarded",                    default: false
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,     null: false
    t.integer  "from_user_id",     limit: 4
    t.string   "title",            limit: 255
    t.text     "body",             limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "messageable_id",   limit: 4
    t.string   "messageable_type", limit: 255
    t.string   "reason",           limit: 255
  end

  create_table "mod_requests", force: :cascade do |t|
    t.integer  "inviting_user_id", limit: 4, null: false
    t.integer  "user_id",          limit: 4, null: false
    t.integer  "subphez_id",       limit: 4, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "moderations", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "subphez_id", limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "newsletter_subscribers", force: :cascade do |t|
    t.string   "email",        limit: 255
    t.boolean  "is_confirmed",             default: false
    t.string   "secret",       limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4,     null: false
    t.integer  "application_id",    limit: 4,     null: false
    t.string   "token",             limit: 255,   null: false
    t.integer  "expires_in",        limit: 4,     null: false
    t.text     "redirect_uri",      limit: 65535, null: false
    t.datetime "created_at",                      null: false
    t.datetime "revoked_at"
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id", limit: 4
    t.integer  "application_id",    limit: 4
    t.string   "token",             limit: 255, null: false
    t.string   "refresh_token",     limit: 255
    t.integer  "expires_in",        limit: 4
    t.datetime "revoked_at"
    t.datetime "created_at",                    null: false
    t.string   "scopes",            limit: 255
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         limit: 255,                null: false
    t.string   "uid",          limit: 255,                null: false
    t.string   "secret",       limit: 255,                null: false
    t.text     "redirect_uri", limit: 65535,              null: false
    t.string   "scopes",       limit: 255,   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id",     limit: 4
    t.string   "owner_type",   limit: 255
  end

  add_index "oauth_applications", ["owner_id", "owner_type"], name: "index_oauth_applications_on_owner_id_and_owner_type", using: :btree
  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content",         limit: 65535
    t.integer  "searchable_id",   limit: 4
    t.string   "searchable_type", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,                     null: false
    t.integer  "subphez_id",      limit: 4,                     null: false
    t.string   "guid",            limit: 255,                   null: false
    t.string   "url",             limit: 255
    t.string   "title",           limit: 255,                   null: false
    t.integer  "vote_total",      limit: 4,     default: 0,     null: false
    t.boolean  "is_self",                       default: false, null: false
    t.text     "body",            limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "points",          limit: 4,     default: 0
    t.integer  "hot_score",       limit: 4,     default: 0
    t.boolean  "is_premium_only",               default: false
    t.boolean  "is_rewarded",                   default: false
    t.integer  "daily_points",    limit: 4,     default: 0
  end

  create_table "rewards", force: :cascade do |t|
    t.integer  "user_id",             limit: 4
    t.float    "amount_usd",          limit: 24
    t.float    "amount_mbtc",         limit: 24
    t.integer  "confirmations_count", limit: 4,   default: 0,     null: false
    t.integer  "rewarded_user_id",    limit: 4
    t.integer  "rewardable_id",       limit: 4
    t.string   "rewardable_type",     limit: 255
    t.integer  "months",              limit: 4
    t.boolean  "payment_confirmed",               default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "funding_source",      limit: 255
  end

  create_table "subphezes", force: :cascade do |t|
    t.integer  "user_id",         limit: 4,                     null: false
    t.string   "path",            limit: 255,                   null: false
    t.string   "title",           limit: 255,                   null: false
    t.text     "sidebar",         limit: 65535
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.boolean  "is_admin_only",                 default: false
    t.boolean  "is_premium_only",               default: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "subphez_id", limit: 4, null: false
    t.datetime "created_at",           null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.float    "amount_mbtc",     limit: 24
    t.string   "txn_type",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bitcoin_address", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                    limit: 255, default: "",    null: false
    t.string   "encrypted_password",       limit: 255, default: "",    null: false
    t.string   "reset_password_token",     limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",            limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",       limit: 255
    t.string   "last_sign_in_ip",          limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "username",                 limit: 255
    t.boolean  "orange",                               default: false
    t.boolean  "is_admin",                             default: false
    t.string   "remember_token",           limit: 255
    t.string   "bitcoin_address",          limit: 255
    t.boolean  "is_premium"
    t.integer  "premium_months",           limit: 4,   default: 0
    t.datetime "premium_since"
    t.datetime "premium_until"
    t.integer  "rewardable_months",        limit: 4,   default: 0
    t.datetime "throttled_until"
    t.boolean  "throttle_exempt",                      default: false
    t.boolean  "is_newsletter_subscribed",             default: false
    t.string   "secret",                   limit: 255
    t.boolean  "is_confirmed",                         default: false
    t.boolean  "is_frozen",                            default: false
    t.boolean  "is_reward_ineligible",                 default: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "post_id",    limit: 4, null: false
    t.integer  "vote_value", limit: 4, null: false
    t.datetime "created_at",           null: false
  end

  add_index "votes", ["user_id", "post_id"], name: "index_votes_on_user_id_and_post_id", unique: true, using: :btree

end
