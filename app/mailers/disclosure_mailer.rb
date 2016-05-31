class DisclosureMailer < ApplicationMailer
  default from: 'ezgo5757@gmail.com'
 
  def buyer_sendmail(buyer)
    @buyer = buyer
    mail(to: @buyer.users.find_by(id: @buyer.created_by).email, 
         subject: '詳細情報開示リクエストが届いています')
  end
  
  def seller_sendmail(seller)
    @seller = seller
    mail(to: seller.users.find_by(id: seller.created_by).email, 
         subject: '詳細情報開示リクエストが届いています')
  end
end
