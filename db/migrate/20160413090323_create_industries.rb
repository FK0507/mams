class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.string :ind_a, null: false
      t.string :ind_b, null: false

      t.timestamps null: false
    end
  end
end
