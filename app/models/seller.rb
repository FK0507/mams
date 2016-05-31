class Seller < ActiveRecord::Base
  
  belongs_to :industry, foreign_key: "industry_id"
  belongs_to :seller_condition, foreign_key: "seller_condition_id"
  
  has_many :seller_users, dependent: :destroy
  has_many :users, through: :seller_users

  has_many :relationships, dependent: :destroy
  has_many :buyers, through: :relationships
  
  records_with_operator_on :create, :update

end
