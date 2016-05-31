class Buyer < ActiveRecord::Base

  belongs_to :industry, foreign_key: "industry_id"
  belongs_to :buyer_condition, foreign_key: "buyer_condition_id"

  has_many :buyer_users, dependent: :destroy
  has_many :users, through: :buyer_users

  has_many :s_relationships, dependent: :destroy
  has_many :sellers, through: :s_relationships
  
  has_many :disclosures, dependent: :destroy
  has_many :sellers, through: :disclosures

  records_with_operator_on :create, :update
end
