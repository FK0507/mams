class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,:invitable,invite_for: 1.weeks
  
  has_many :buyer_users, dependent: :destroy
  has_many :buyers, through: :buyer_users

  has_many :seller_users, dependent: :destroy
  has_many :sellers, through: :seller_users

  records_with_operator_on :create, :update

end
