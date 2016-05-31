class RelationshipsController < ApplicationController
before_action :sign_in_required ,only: [:index, :update, :destroy]
#before_action :set_relationships ,only: [:index, :edit, :update]
  
  def index
    if current_user.kind == "buyer" then      # 買い手でログインしている場合
      @buyer = current_user.buyers[0]         # current_user（buyer_user)と紐づくbuyer(配列)のうち先頭のbuyer(ハッシュ)
      @company = @buyer.sellers.uniq          # @buyerに紐づくseller(ハッシュが入り子となった配列) uniqで重複を削除
    elsif current_user.kind == "seller" then
      @seller = current_user.sellers[0]
      @company = @seller.buyers.uniq
    end
    
  end
  
  def create
    if current_user.kind == "buyer" then
      @seller = Seller.find(params[:seller_id])
      @buyer = current_user.buyers[0]
      @seller.relationships.create(buyer_id: @buyer.id, seller_id: @seller.id, status: "follow", author_kind: "buyer")
      redirect_to sellers_url
    elsif  current_user.kind == "seller" then
      @buyer = Buyer.find(params[:buyer_id])
      @seller = current_user.sellers[0]
      @buyer.relationships.create(buyer_id: @buyer.id, seller_id: @seller.id, status: "follow", author_kind: "seller")
      redirect_to buyers_url
    end  
  end

  def edit
  end

  def update
    @relationships = Relationship.find_by(id: params[:id])
    if @relationships.update(relationship_params)      # /view/relationships/_acceptanceやdenialから受け取ったparamsに含まれるstatusを使って、@disclosureを更新
                                                       # @relationshipsはbefore_actionのset_relationshipsにてオブジェクト生成済み
      if relationship_params[:status] == "pending"
        if current_user.kind == "buyer" then
          @seller = Buyer.find_by(id: @relationships.seller_id)
          respond_to do |format|                     # app/mailer/disclosure_mailerのseller_sendmailアクションを呼び出し、deliver_laterメソッドでメール送信する
            DisclosureMailer.seller_sendmail(@seller).deliver_later
            format.html { redirect_to(:back) } # 送信するメールのレイアウト(view/disclosure_mailerフォルダ)はhtmlを指定し、送信後は前画面へ遷移
            flash[:success] = "情報開示リクエストが送信されました。"
          end
        elsif current_user.kind == "seller" then
          @buyer = Buyer.find_by(id: @relationships.buyer_id)
          respond_to do |format|                     # app/mailer/disclosure_mailerのbuyer_sendmailアクションを呼び出し、deliver_laterメソッドでメール送信する
            DisclosureMailer.buyer_sendmail(@seller).deliver_later
            format.html { redirect_to(:back) } # 送信するメールのレイアウト(view/disclosure_mailerフォルダ)はhtmlを指定し、送信後は前画面へ遷移
            flash[:success] = "情報開示リクエストが送信されました。"
          end
        end
      else
        # 受信した情報開示リクエストを承認した場合、自分がauthorのrelationshipも"accepted"へ更新する
        if relationship_params[:status] == "accepted"
          @paired_relationship = Relationship.where("buyer_id = ? and seller_id = ? and author_kind != ?" , @relationships.buyer_id, @relationships.seller_id, @relationships.author_kind).first
          @paired_relationship.update(status: "accepted")
        end
        
        flash[:success] = "更新しました。" 
        redirect_to(:back) 
      end
    else
      redirect_to(:back)                 # 保存に失敗したら前画面へ遷移
    end
  end

  def destroy
    if current_user.kind == "buyer" then
      @seller = Relationship.find(params[:id]).seller
      @buyer = current_user.buyers[0]
      @seller.relationships.find_by(buyer_id: @buyer.id, author_kind: "buyer").destroy
    elsif  current_user.kind == "seller" then
      @buyer = Relationship.find(params[:id]).buyer
      @seller = current_user.sellers[0]
      @buyer.relationships.find_by(seller_id: @seller.id, author_kind: "seller").destroy
    end
    redirect_to(:back)
  end
  
    private
  
  def set_relationships
    @relationships = Relationship.find(params[:id])    # /view/
  end
  
  def relationship_params
    params.require(:relationship).permit(:buyer_id, :seller_id, :status, :author_kind)
  end  
  
end