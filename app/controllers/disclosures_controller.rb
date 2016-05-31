class DisclosuresController < ApplicationController
before_action :sign_in_required ,only: [:index, :update, :destroy]
before_action :set_disclosure ,only: [:edit, :update]

  def index
    if current_user.kind == "buyer" then      # 買い手でログインしている場合
      @buyer = current_user.buyers[0]         # current_user（buyer_user)と紐づくbuyer(配列)のうち先頭のbuyer(ハッシュ)
      @company = @buyer.sellers               # @buyerに紐づくseller(ハッシュが入り子となった配列)
    elsif current_user.kind == "seller" then
      @seller = current_user.sellers[0]
      @company = @seller.buyers
    end
  end
  
  def create
    if current_user.kind == "buyer" then         # 買い手でログインしている場合
      
      @seller = Seller.find(params[:seller_id])  # seller/_disclosureビューからsubmitで受け取ったparamsに含まれるseller_idをキーにしてsellerを抽出
                                                 # index(売り手リスト）から選択したsellerのidが渡されるだけ
      
      @buyer = current_user.buyers[0]            # current_user（buyer_user)と紐づくbuyer(配列)のうち先頭のbuyer(ハッシュ)
                                                 # 今後、userが複数のbuyerを持つようにするには、この部分は要修正
      
      # 売り手リストで選択したsellerに紐づくdisclosureを作成する。statusカラムは"pending"（申請中）を入れる。
      # author_kindカラムはdisclosure作成者である"buyer"を入れる（自分が申請（作成）したdisclosureを承認出来ないようにするため）
      @seller.disclosures.create(buyer_id: @buyer.id, seller_id: @seller.id, status: "pending", author_kind: "buyer")
      
      respond_to do |format|                     # app/mailer/disclosure_mailerのseller_sendmailアクションを呼び出し、deliver_laterメソッドでメール送信する
        DisclosureMailer.seller_sendmail(@seller).deliver_later
        format.html { redirect_to sellers_path } # 送信するメールのレイアウト(view/disclosure_mailerフォルダ)はhtmlを指定し、送信後は売り手リストへリダイレクト
        flash[:success] = "情報開示リクエストが送信されました。"
      end

    elsif current_user.kind == "seller" then
      @buyer = Buyer.find(params[:buyer_id])     
      @seller = current_user.sellers[0]
      @buyer.disclosures.create(buyer_id: @buyer.id, seller_id: @seller.id, status: "pending", author_kind: "seller")
      respond_to do |format|
        DisclosureMailer.buyer_sendmail(@buyer).deliver_later
        format.html { redirect_to buyers_path } 
        flash[:success] = "情報開示リクエストが送信されました。"
      end
    end
  end

  def edit
  end

  def update
    if @disclosure.update(disclosure_params)      # /view/disclosures/_acceptanceやdenialから受け取ったparamsに含まれるstatusを使って、@disclosureを更新
                                                        # @disclosureはbefore_actionのset_disclosureにてオブジェクト生成済み
      flash[:success] = "情報開示リクエストを更新しました。"
    end
    redirect_to(:back)                                     # 保存に成功しても失敗してもindex（情報開示状況の一覧）へ遷移
  end
  
  def destroy
    Disclosure.find_by(id: params[:id]).destroy   # /view/disclosures/_cancelから受け取ったparamsに含まれるid（disclosureのid）
    redirect_to(:back)
  end
  
  private
  
  def set_disclosure
    @disclosure = Disclosure.find(params[:id])    # /view/
  end
  
  def disclosure_params
    params.require(:disclosure).permit(:buyer_id, :seller_id, :status, :author_kind)
  end  

end
