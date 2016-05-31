class Industry < ActiveRecord::Base
    
    has_many :sellers
    has_many :buyers
    records_with_operator_on :create, :update

end
