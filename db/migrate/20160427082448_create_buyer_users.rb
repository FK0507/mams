class CreateBuyerUsers < ActiveRecord::Migration
  def change
    create_table :buyer_users do |t|
      t.references :buyer, index: true, null: false
      t.references :user, index: true, null: false
      t.timestamps null: false
      t.index [:buyer_id, :user_id], unique: true
    end
  end
end
