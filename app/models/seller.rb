class Seller < ActiveRecord::Base
  
  belongs_to :industry, foreign_key: "industry_id"
  belongs_to :seller_condition, foreign_key: "seller_condition_id"
  
  has_many :seller_users, dependent: :destroy
  has_many :users, through: :seller_users

  has_many :b_relationships, dependent: :destroy
  has_many :buyers, through: :b_relationships
  
  has_many :disclosures, dependent: :destroy
  has_many :buyers, through: :disclosures
  
  records_with_operator_on :create, :update


  # ユーザーをフォローする
  def follow(seller,buyer)
    b_relationships.create(seller_id: @seller.id, buyer_id: @buyer[0].id)
  end

  # ユーザーをアンフォローする
  def unfollow(seller)
    b_relationships.find_by(seller_id: seller.id).destroy
  end

  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(seller)
    followering.include?(seller)
  end
  
#  validates :cname, uniqueness: true
#  validates :seller_condition_id, presence: true

end
