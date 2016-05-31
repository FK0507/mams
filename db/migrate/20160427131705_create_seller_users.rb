class CreateSellerUsers < ActiveRecord::Migration
  def change
    create_table :seller_users do |t|
      t.references :seller, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
      t.index [:seller_id, :user_id], unique: true
    end
  end
end
