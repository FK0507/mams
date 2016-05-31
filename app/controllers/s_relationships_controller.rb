class SRelationshipsController < ApplicationController
  def create
    @buyer = Buyer.find(params[:buyer_id])
    @seller = current_user.sellers[0] if current_user.kind == "seller"
    @buyer.s_relationships.create(buyer_id: @buyer.id, seller_id: @seller.id)
    redirect_to(:back)
  end

  def destroy
    @buyer = SRelationship.find(params[:id]).buyer
    @seller = current_user.sellers[0] if current_user.kind == "seller"
    @buyer.s_relationships.find_by(buyer_id: @buyer.id).destroy
    redirect_to(:back)
  end
end
