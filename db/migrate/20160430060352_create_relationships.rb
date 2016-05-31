class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.string  :status     #フォロー・情報開示申請の承認有無の識別(アンフォロー：nil フォロー済み：follow  承諾済み："accepted"、申請中："pending"、拒否："denied")
      t.string  :author_kind  #主体がbuyerかsellerか、識別する

      t.timestamps null: false
    end
    add_index :relationships, :buyer_id
    add_index :relationships, :seller_id
#    add_index :relationships, [:buyer_id, :seller_id, :author_kind], unique: true, :name => 'relation_index'
  end
end
