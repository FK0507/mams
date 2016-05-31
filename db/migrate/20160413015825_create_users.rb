class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :gname
#      t.string :email
      t.string :kind #売り手、買い手、システムユーザーの識別
      t.string :role #管理者、一般ユーザー、サポーターの識別

#      t.string :password_digest
#      t.string :remember_digest
      
      t.timestamps null: false
      
#      t.index :email, unique: true
      
    end
  end
end
