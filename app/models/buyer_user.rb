class BuyerUser < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :user
end
