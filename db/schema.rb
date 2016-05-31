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

ActiveRecord::Schema.define(version: 20160531052106) do

  create_table "buyer_conditions", force: :cascade do |t|
    t.string   "b_condit",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buyer_users", force: :cascade do |t|
    t.integer  "buyer_id",   null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buyer_users", ["buyer_id", "user_id"], name: "index_buyer_users_on_buyer_id_and_user_id", unique: true
  add_index "buyer_users", ["buyer_id"], name: "index_buyer_users_on_buyer_id"
  add_index "buyer_users", ["user_id"], name: "index_buyer_users_on_user_id"

  create_table "buyers", force: :cascade do |t|
    t.integer  "industry_id"
    t.integer  "buyer_condition_id"
    t.string   "cname"
    t.string   "cname_kana"
    t.string   "charge"
    t.integer  "zip"
    t.string   "pref"
    t.string   "city"
    t.string   "adr"
    t.string   "listed"
    t.string   "president"
    t.text     "about"
    t.text     "goods"
    t.integer  "dir"
    t.integer  "reg"
    t.integer  "par"
    t.integer  "cap"
    t.text     "comment"
    t.string   "unit"
    t.integer  "p_sales"
    t.integer  "p_orin"
    t.text     "phil"
    t.text     "appeal"
    t.text     "future"
    t.string   "busi_name1"
    t.text     "busi_about1"
    t.text     "busi_goods1"
    t.integer  "busi_sales1"
    t.text     "busi_stro1"
    t.text     "busi_weak1"
    t.string   "busi_name2"
    t.text     "busi_about2"
    t.text     "busi_goods2"
    t.integer  "busi_sales2"
    t.text     "busi_stro2"
    t.text     "busi_weak2"
    t.string   "busi_name3"
    t.text     "busi_goods3"
    t.text     "busi_about3"
    t.integer  "busi_sales3"
    t.text     "busi_stro3"
    t.text     "busi_weak3"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "buyers", ["buyer_condition_id"], name: "index_buyers_on_buyer_condition_id"
  add_index "buyers", ["industry_id"], name: "index_buyers_on_industry_id"

  create_table "disclosures", force: :cascade do |t|
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.string   "status"
    t.string   "author_kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "disclosures", ["buyer_id", "seller_id"], name: "index_disclosures_on_buyer_id_and_seller_id", unique: true
  add_index "disclosures", ["buyer_id"], name: "index_disclosures_on_buyer_id"
  add_index "disclosures", ["seller_id"], name: "index_disclosures_on_seller_id"

  create_table "industries", force: :cascade do |t|
    t.string   "ind_a",      null: false
    t.string   "ind_b",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.string   "status"
    t.string   "author_kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["buyer_id"], name: "index_relationships_on_buyer_id"
  add_index "relationships", ["seller_id"], name: "index_relationships_on_seller_id"

  create_table "seller_conditions", force: :cascade do |t|
    t.string   "s_condit",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seller_users", force: :cascade do |t|
    t.integer  "seller_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seller_users", ["seller_id", "user_id"], name: "index_seller_users_on_seller_id_and_user_id", unique: true
  add_index "seller_users", ["seller_id"], name: "index_seller_users_on_seller_id"
  add_index "seller_users", ["user_id"], name: "index_seller_users_on_user_id"

  create_table "sellers", force: :cascade do |t|
    t.integer  "industry_id"
    t.integer  "seller_condition_id"
    t.string   "charge"
    t.text     "goods"
    t.integer  "dir"
    t.integer  "reg"
    t.integer  "par"
    t.integer  "cap"
    t.string   "adv"
    t.text     "point"
    t.string   "cname"
    t.string   "cname_kana"
    t.integer  "zip"
    t.string   "pref"
    t.string   "city"
    t.string   "adr"
    t.string   "president"
    t.string   "mainbk_name"
    t.string   "mainbk_kind"
    t.string   "mainbk_branch"
    t.string   "mainbk_bkind"
    t.text     "re_about"
    t.string   "sh_name1"
    t.integer  "sh_num1"
    t.string   "sh_rel1"
    t.string   "sh_pos1"
    t.string   "sh_name2"
    t.integer  "sh_num2"
    t.string   "sh_rel2"
    t.string   "sh_pos2"
    t.string   "sh_name3"
    t.integer  "sh_num3"
    t.string   "sh_rel3"
    t.string   "sh_pos3"
    t.string   "sh_name4"
    t.integer  "sh_num4"
    t.string   "sh_rel4"
    t.string   "sh_pos4"
    t.string   "sh_name5"
    t.integer  "sh_num5"
    t.string   "sh_rel5"
    t.string   "sh_pos5"
    t.text     "sh_about"
    t.text     "phil_p"
    t.text     "phil_f"
    t.text     "d_point"
    t.text     "reason"
    t.text     "req"
    t.string   "condit_must1"
    t.string   "condit_must2"
    t.string   "condit_must3"
    t.string   "condit_better1"
    t.string   "condit_better2"
    t.string   "condit_better3"
    t.text     "condit_other"
    t.text     "goods_kinds"
    t.text     "goods_stro"
    t.text     "goods_weak"
    t.integer  "cust_num"
    t.string   "cust_unit"
    t.string   "cust_imp_name1"
    t.integer  "cust_imp_vol1"
    t.string   "cust_imp_unit1"
    t.text     "cust_imp_reas1"
    t.string   "cust_imp_name2"
    t.integer  "cust_imp_vol2"
    t.string   "cust_imp_unit2"
    t.text     "cust_imp_reas2"
    t.string   "cust_imp_name3"
    t.integer  "cust_imp_vol3"
    t.string   "cust_imp_unit3"
    t.text     "cust_imp_reas3"
    t.text     "cust_reas"
    t.text     "cust_rela"
    t.text     "knowhow_tech_1"
    t.text     "knowhow_tech_2"
    t.text     "knowhow_tech_3"
    t.text     "knowhow_sales_1"
    t.text     "knowhow_sales_2"
    t.text     "knowhow_sales_3"
    t.text     "knowhow_dev_1"
    t.text     "knowhow_dev_2"
    t.text     "knowhow_dev_3"
    t.text     "knowhow_sup_1"
    t.text     "knowhow_sup_2"
    t.text     "knowhow_sup_3"
    t.text     "knowhow_prob"
    t.string   "knowhow_cont_kinds1"
    t.text     "knowhow_cont_con1"
    t.string   "knowhow_cont_kinds2"
    t.text     "knowhow_cont_con2"
    t.string   "knowhow_cont_kinds3"
    t.text     "knowhow_cont_con3"
    t.string   "hr_key_posi1"
    t.string   "hr_key_field1"
    t.string   "hr_key_reas1"
    t.string   "hr_key_posi2"
    t.string   "hr_key_field2"
    t.string   "hr_key_reas2"
    t.string   "hr_key_posi3"
    t.string   "hr_key_field3"
    t.string   "hr_key_reas3"
    t.text     "hr_hope"
    t.text     "hr_moti"
    t.text     "proj_vision"
    t.text     "proj_todo"
    t.text     "proj_prob"
    t.text     "busi_about"
    t.string   "busi_unit"
    t.string   "busi_name1"
    t.text     "busi_about1"
    t.text     "busi_goods1"
    t.integer  "busi_sales1"
    t.text     "busi_stro1"
    t.text     "busi_weak1"
    t.string   "busi_name2"
    t.text     "busi_about2"
    t.text     "busi_goods2"
    t.integer  "busi_sales2"
    t.text     "busi_stro2"
    t.text     "busi_weak2"
    t.string   "busi_name3"
    t.text     "busi_about3"
    t.text     "busi_goods3"
    t.integer  "busi_sales3"
    t.text     "busi_stro3"
    t.text     "busi_weak3"
    t.string   "aff_yn"
    t.string   "aff_name1"
    t.string   "aff_sh1_name1"
    t.integer  "aff_sh1_per1"
    t.string   "aff_sh2_name1"
    t.integer  "aff_sh2_per1"
    t.string   "aff_sh3_name1"
    t.integer  "aff_sh3_per1"
    t.text     "aff_busi1"
    t.string   "aff_name2"
    t.string   "aff_sh1_name2"
    t.integer  "aff_sh1_per2"
    t.string   "aff_sh2_name2"
    t.integer  "aff_sh2_per2"
    t.string   "aff_sh3_name2"
    t.integer  "aff_sh3_per2"
    t.text     "aff_busi2"
    t.string   "aff_name3"
    t.string   "aff_sh1_name3"
    t.integer  "aff_sh1_per3"
    t.string   "aff_sh2_name3"
    t.integer  "aff_sh2_per3"
    t.string   "aff_sh3_name3"
    t.integer  "aff_sh3_per3"
    t.text     "aff_busi3"
    t.text     "aff_about"
    t.string   "eq_kind1"
    t.string   "eq_name1"
    t.string   "eq_year1"
    t.text     "eq_point1"
    t.string   "eq_kind2"
    t.string   "eq_name2"
    t.string   "eq_year2"
    t.text     "eq_point2"
    t.string   "eq_kind3"
    t.string   "eq_name3"
    t.string   "eq_year3"
    t.text     "eq_point3"
    t.string   "re_name1"
    t.string   "re_kind1"
    t.integer  "re_area1"
    t.string   "re_a_unit1"
    t.text     "re_use1"
    t.integer  "re_val1"
    t.string   "re_v_unit1"
    t.string   "re_name2"
    t.string   "re_kind2"
    t.integer  "re_area2"
    t.string   "re_a_unit2"
    t.text     "re_use2"
    t.integer  "re_val2"
    t.string   "re_v_unit2"
    t.string   "re_name3"
    t.string   "re_kind3"
    t.integer  "re_area3"
    t.string   "re_a_unit3"
    t.text     "re_use3"
    t.integer  "re_val3"
    t.string   "re_v_unit3"
    t.string   "fi_kind1"
    t.string   "fi_name1"
    t.string   "fi_unit1"
    t.integer  "fi_val1"
    t.string   "fi_kind2"
    t.string   "fi_name2"
    t.string   "fi_unit2"
    t.integer  "fi_val2"
    t.string   "fi_kind3"
    t.string   "fi_name3"
    t.string   "fi_unit3"
    t.integer  "fi_val3"
    t.text     "fi_about"
    t.string   "unit"
    t.integer  "p_fy_y"
    t.integer  "p_fy_m"
    t.integer  "pp_fy_y"
    t.integer  "pp_fy_m"
    t.integer  "ppp_fy_y"
    t.integer  "ppp_fy_m"
    t.integer  "p_sales",             limit: 8
    t.integer  "p_cogs",              limit: 8
    t.integer  "p_gp",                limit: 8
    t.integer  "p_sga",               limit: 8
    t.integer  "p_opin",              limit: 8
    t.integer  "p_orin",              limit: 8
    t.integer  "p_nein",              limit: 8
    t.integer  "pp_sales",            limit: 8
    t.integer  "pp_cogs",             limit: 8
    t.integer  "pp_gp",               limit: 8
    t.integer  "pp_sga",              limit: 8
    t.integer  "pp_opin",             limit: 8
    t.integer  "pp_orin",             limit: 8
    t.integer  "pp_nein",             limit: 8
    t.integer  "ppp_sales",           limit: 8
    t.integer  "ppp_cogs",            limit: 8
    t.integer  "ppp_gp",              limit: 8
    t.integer  "ppp_sga",             limit: 8
    t.integer  "ppp_opin",            limit: 8
    t.integer  "ppp_orin",            limit: 8
    t.integer  "ppp_nein",            limit: 8
    t.string   "sal_name1"
    t.string   "sal_name2"
    t.string   "sal_name3"
    t.integer  "sal_val1",            limit: 8
    t.integer  "sal_val2",            limit: 8
    t.integer  "sal_val3",            limit: 8
    t.string   "pur_name1"
    t.string   "pur_name2"
    t.string   "pur_name3"
    t.integer  "pur_val1",            limit: 8
    t.integer  "pur_val2",            limit: 8
    t.integer  "pur_val3",            limit: 8
    t.string   "os_name1"
    t.string   "os_name2"
    t.string   "os_name3"
    t.integer  "os_val1",             limit: 8
    t.integer  "os_val2",             limit: 8
    t.integer  "os_val3",             limit: 8
    t.integer  "p_ca",                limit: 8
    t.integer  "p_nca",               limit: 8
    t.integer  "p_cl",                limit: 8
    t.integer  "p_ncl",               limit: 8
    t.integer  "p_na",                limit: 8
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "sellers", ["industry_id"], name: "index_sellers_on_industry_id"
  add_index "sellers", ["seller_condition_id"], name: "index_sellers_on_seller_condition_id"

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at"

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "gname"
    t.string   "kind"
    t.string   "role"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.integer  "created_by"
    t.integer  "updated_by"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
