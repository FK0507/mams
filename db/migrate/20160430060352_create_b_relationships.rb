class CreateBRelationships < ActiveRecord::Migration
  def change
    create_table :b_relationships do |t|
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps null: false
    end
    add_index :b_relationships, :seller_id
    add_index :b_relationships, :buyer_id
    add_index :b_relationships, [:seller_id, :buyer_id], unique: true
  end
end
