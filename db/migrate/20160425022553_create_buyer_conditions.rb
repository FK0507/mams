class CreateBuyerConditions < ActiveRecord::Migration
  def change
    create_table :buyer_conditions do |t|
      t.string :b_condit, null: false

      t.timestamps null: false
    end
  end
end
