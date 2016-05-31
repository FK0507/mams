class CreateSRelationships < ActiveRecord::Migration
  def change
    create_table :s_relationships do |t|
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps null: false
    end
    add_index :s_relationships, :seller_id
    add_index :s_relationships, :buyer_id
    add_index :s_relationships, [:seller_id, :buyer_id], unique: true
  end
end