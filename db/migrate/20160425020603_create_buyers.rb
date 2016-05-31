class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      
      t.references :industry, index: true, foreign_key: true
      t.references :buyer_condition, index: true, foreign_key: true
      t.string :cname
      t.string :cname_kana
      t.string :charge   #無課金、課金の識別
      t.integer :zip
      t.string :pref
      t.string :city
      t.string :adr
      t.string :listed
      t.string :president
      t.text :about
      t.text :goods
      t.integer :dir
      t.integer :reg
      t.integer :par
      t.integer :cap
      t.text :comment
      t.string :unit
      t.integer :p_sales
      t.integer :p_orin
      t.text :phil
      t.text :appeal
      t.text :future
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
      t.text :busi_goods3
      t.text :busi_about3
      t.integer :busi_sales3
      t.text :busi_stro3
      t.text :busi_weak3
      t.timestamps null: false
    end
  end
end
