class AddOperatorToModel < ActiveRecord::Migration
  def change
    add_column :users, :created_by, :integer
    add_column :users, :updated_by, :integer
    add_column :sellers, :created_by, :integer
    add_column :sellers, :updated_by, :integer
    add_column :buyers, :created_by, :integer
    add_column :buyers, :updated_by, :integer
    add_column :industries, :created_by, :integer
    add_column :industries, :updated_by, :integer
  end
end
