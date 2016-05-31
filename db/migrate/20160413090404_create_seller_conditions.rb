class CreateSellerConditions < ActiveRecord::Migration
  def change
    create_table :seller_conditions do |t|
      t.string :s_condit, null: false

      t.timestamps null: false
    end
  end
end
