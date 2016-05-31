class CreateDisclosures < ActiveRecord::Migration
  def change
    create_table :disclosures do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.string  :status     #情報開示申請の承認有無の識別(承諾済み："accepted"、申請中："pending"、拒否："denied"、未申請：nil)
      t.string  :author_kind  #Disclosureの作成者がsellerかbuyerか、識別する

      t.timestamps null: false
    end
    add_index :disclosures, :seller_id
    add_index :disclosures, :buyer_id
    add_index :disclosures, [:buyer_id, :seller_id], unique: true
  end
end
