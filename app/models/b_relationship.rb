class BRelationship < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :seller
  
  validates :buyer_id, presence: true
  validates :seller_id, presence: true
end
