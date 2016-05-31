class BRelationshipsController < ApplicationController
  def create
    @seller = Seller.find(params[:seller_id])
    @buyer = current_user.buyers[0] if current_user.kind == "buyer"
    @seller.b_relationships.create(buyer_id: @buyer.id, seller_id: @seller.id)
    redirect_to(:back)
  end

  def destroy
    @seller = BRelationship.find(params[:id]).seller
    @buyer = current_user.buyers[0] if current_user.kind == "buyer"
    @seller.b_relationships.find_by(seller_id: @seller.id).destroy
    redirect_to(:back)
  end
  
end