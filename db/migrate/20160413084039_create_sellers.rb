class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.references :industry, index: true, foreign_key: true
      t.references :seller_condition, index: true, foreign_key: true
      t.string :charge   #無課金、課金の識別
      t.text :goods
      t.integer :dir
      t.integer :reg
      t.integer :par
      t.integer :cap
      t.string :adv
      t.text :point
      t.string :cname
      t.string :cname_kana
      t.integer :zip
      t.string :pref
      t.string :city
      t.string :adr
      t.string :president
      t.string :mainbk_name
      t.string :mainbk_kind
      t.string :mainbk_branch
      t.string :mainbk_bkind
      t.text :re_about
      t.string :sh_name1
      t.integer :sh_num1
      t.string :sh_rel1
      t.string :sh_pos1
      t.string :sh_name2
      t.integer :sh_num2
      t.string :sh_rel2
      t.string :sh_pos2      
      t.string :sh_name3
      t.integer :sh_num3
      t.string :sh_rel3
      t.string :sh_pos3
      t.string :sh_name4
      t.integer :sh_num4
      t.string :sh_rel4
      t.string :sh_pos4
      t.string :sh_name5
      t.integer :sh_num5
      t.string :sh_rel5
      t.string :sh_pos5
      t.text :sh_about
      t.text :phil_p
      t.text :phil_f
      t.text :d_point
      t.text :reason
      t.text :req
      t.string :condit_must1
      t.string :condit_must2
      t.string :condit_must3
      t.string :condit_better1
      t.string :condit_better2
      t.string :condit_better3
      t.text :condit_other
      t.text :goods_kinds
      t.text :goods_stro
      t.text :goods_weak
      t.integer :cust_num
      t.string :cust_unit
      t.string :cust_imp_name1
      t.integer :cust_imp_vol1
      t.string :cust_imp_unit1
      t.text :cust_imp_reas1
      t.string :cust_imp_name2
      t.integer :cust_imp_vol2
      t.string :cust_imp_unit2
      t.text :cust_imp_reas2
      t.string :cust_imp_name3
      t.integer :cust_imp_vol3
      t.string :cust_imp_unit3
      t.text :cust_imp_reas3
      t.text :cust_reas
      t.text :cust_rela
      t.text :knowhow_tech_1
      t.text :knowhow_tech_2
      t.text :knowhow_tech_3
      t.text :knowhow_sales_1
      t.text :knowhow_sales_2
      t.text :knowhow_sales_3
      t.text :knowhow_dev_1
      t.text :knowhow_dev_2
      t.text :knowhow_dev_3
      t.text :knowhow_sup_1
      t.text :knowhow_sup_2
      t.text :knowhow_sup_3
      t.text :knowhow_prob
      t.string :knowhow_cont_kinds1
      t.text :knowhow_cont_con1
      t.string :knowhow_cont_kinds2
      t.text :knowhow_cont_con2
      t.string :knowhow_cont_kinds3
      t.text :knowhow_cont_con3
      t.string :hr_key_posi1
      t.string :hr_key_field1
      t.string :hr_key_reas1
      t.string :hr_key_posi2
      t.string :hr_key_field2
      t.string :hr_key_reas2
      t.string :hr_key_posi3
      t.string :hr_key_field3
      t.string :hr_key_reas3
      t.text :hr_hope
      t.text :hr_moti
      t.text :proj_vision
      t.text :proj_todo
      t.text :proj_prob
      t.text :busi_about
      t.string :busi_unit
      t.string :busi_name1
      t.text :busi_about1
      t.text :busi_goods1
      t.integer :busi_sales1
      t.text :busi_stro1
      t.text :busi_weak1
      t.string :busi_name2
      t.text :busi_about2
      t.text :busi_goods2
      t.integer :busi_sales2
      t.text :busi_stro2
      t.text :busi_weak2
      t.string :busi_name3
      t.text :busi_about3
      t.text :busi_goods3
      t.integer :busi_sales3
      t.text :busi_stro3
      t.text :busi_weak3
      t.string :aff_yn
      t.string :aff_name1
      t.string :aff_sh1_name1
      t.integer :aff_sh1_per1
      t.string :aff_sh2_name1
      t.integer :aff_sh2_per1
      t.string :aff_sh3_name1
      t.integer :aff_sh3_per1
      t.text :aff_busi1
      t.string :aff_name2
      t.string :aff_sh1_name2
      t.integer :aff_sh1_per2
      t.string :aff_sh2_name2
      t.integer :aff_sh2_per2
      t.string :aff_sh3_name2
      t.integer :aff_sh3_per2
      t.text :aff_busi2
      t.string :aff_name3
      t.string :aff_sh1_name3
      t.integer :aff_sh1_per3
      t.string :aff_sh2_name3
      t.integer :aff_sh2_per3
      t.string :aff_sh3_name3
      t.integer :aff_sh3_per3
      t.text :aff_busi3
      t.text :aff_about
      t.string :eq_kind1
      t.string :eq_name1
      t.string :eq_year1
      t.text :eq_point1
      t.string :eq_kind2
      t.string :eq_name2
      t.string :eq_year2
      t.text :eq_point2
      t.string :eq_kind3
      t.string :eq_name3
      t.string :eq_year3
      t.text :eq_point3
      t.string :re_name1
      t.string :re_kind1
      t.integer :re_area1
      t.string :re_a_unit1
      t.text:re_use1
      t.integer :re_val1
      t.string :re_v_unit1
      t.string :re_name2
      t.string :re_kind2
      t.integer :re_area2
      t.string :re_a_unit2
      t.text :re_use2
      t.integer :re_val2
      t.string :re_v_unit2
      t.string :re_name3
      t.string :re_kind3
      t.integer :re_area3
      t.string :re_a_unit3
      t.text :re_use3
      t.integer :re_val3
      t.string :re_v_unit3
      t.string :fi_kind1
      t.string :fi_name1
      t.string :fi_unit1
      t.integer :fi_val1
      t.string :fi_kind2
      t.string :fi_name2
      t.string :fi_unit2
      t.integer :fi_val2
      t.string :fi_kind3
      t.string :fi_name3
      t.string :fi_unit3
      t.integer :fi_val3
      t.text :fi_about
      t.string :unit
      t.integer :p_fy_y
      t.integer :p_fy_m
      t.integer :pp_fy_y
      t.integer :pp_fy_m
      t.integer :ppp_fy_y
      t.integer :ppp_fy_m
      t.integer :p_sales, :limit => 8   # bigint
      t.integer :p_cogs, :limit => 8   # bigint
      t.integer :p_gp, :limit => 8   # bigint
      t.integer :p_sga, :limit => 8   # bigint
      t.integer :p_opin, :limit => 8   # bigint
      t.integer :p_orin, :limit => 8   # bigint
      t.integer :p_nein, :limit => 8   # bigint
      t.integer :pp_sales, :limit => 8   # bigint
      t.integer :pp_cogs, :limit => 8   # bigint
      t.integer :pp_gp, :limit => 8   # bigint
      t.integer :pp_sga, :limit => 8   # bigint
      t.integer :pp_opin, :limit => 8   # bigint
      t.integer :pp_orin, :limit => 8   # bigint
      t.integer :pp_nein, :limit => 8   # bigint
      t.integer :ppp_sales, :limit => 8   # bigint
      t.integer :ppp_cogs, :limit => 8   # bigint
      t.integer :ppp_gp, :limit => 8   # bigint
      t.integer :ppp_sga, :limit => 8   # bigint
      t.integer :ppp_opin, :limit => 8   # bigint
      t.integer :ppp_orin, :limit => 8   # bigint
      t.integer :ppp_nein, :limit => 8   # bigint
      t.string :sal_name1
      t.string :sal_name2
      t.string :sal_name3
      t.integer :sal_val1, :limit => 8   # bigint
      t.integer :sal_val2, :limit => 8   # bigint
      t.integer :sal_val3, :limit => 8   # bigint
      t.string :pur_name1
      t.string :pur_name2
      t.string :pur_name3
      t.integer :pur_val1, :limit => 8   # bigint
      t.integer :pur_val2, :limit => 8   # bigint
      t.integer :pur_val3, :limit => 8   # bigint
      t.string :os_name1
      t.string :os_name2
      t.string :os_name3
      t.integer :os_val1, :limit => 8   # bigint
      t.integer :os_val2, :limit => 8   # bigint
      t.integer :os_val3, :limit => 8   # bigint
      t.integer :p_ca, :limit => 8   # bigint
      t.integer :p_nca, :limit => 8   # bigint
      t.integer :p_cl, :limit => 8   # bigint
      t.integer :p_ncl, :limit => 8   # bigint
      t.integer :p_na, :limit => 8   # bigint
      t.timestamps null: false
    end
  end
end
