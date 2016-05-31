class BuyersController < ApplicationController
  before_action :sign_in_required, only: [:create]
  before_action :set_buyer, only: [:show, :new_detail, :show_detail, :edit, :update, :destroy, :follow]
  before_action :set_user, only: [:new_detail, :new_summary, :edit]
  before_action :set_show, only: [:show]
  before_action :set_new, only: [:new]
  before_action :set_association, only: [:create]
  before_action :authenticate_user!, only: [:index]
  load_and_authorize_resource
  
  def index
    @buyers = Buyer.all
  end
  
  def new
    if current_user.buyers.empty?
      @buyer = Buyer.new
    else
      flash[:success] = "あなたはすでに企業情報を登録済です。"
      redirect_to root_url
    end      
  end
  
  def new_summary
  end

  def new_detail
  end

  def create
    @buyer = Buyer.new(buyer_params)
    @user.buyers << @buyer
    if @buyer.save
      flash[:success] = "企業情報を登録しました。"
      redirect_to buyer_path(@buyer.id)
    else
      render 'static_pages/home'
    end
  end

  def show
   @seller = current_user.sellers[0] if current_user.kind == "seller"
  end
  
  def show_detail
  end
  
  def edit  
    @buyer = Buyer.find(params[:id])
    @industries = Industry.all
    @b_condits = BuyerCondition.all
  end
  
  def update
    if @buyer.update(buyer_params)
      #保存に成功した場合はトップページへリダイレクト
      flash[:success] = "企業情報を更新しました。"
      redirect_to user_path(current_user) 
    else
      #保存に失敗した場合には編集画面に戻す
      render 'edit'
    end
  end

  def destroy
    return redirect_to root_url if @buyer.nil?
    @buyer.destroy
    flash[:success]="企業情報を削除しました。"
    redirect_to request.referrer || root_url
  end  

  def followers
    @title = "Followers"
    @buyer = Buyer.find(params[:id])
    @followers = @buyer.relationships.find(follower_kind: "seller")
  end
  
private
  def buyer_params
      params.require(:buyer).permit(:cname, :cname_kana, :zip, :pref, :city, :adr, :listed, :president, :about, 
                                    :goods, :dir, :reg, :par, :cap, :industry_id, :buyer_condition_id, :comment,
                                    :unit, :p_sales, :p_opin, :phil, :appeal, :future,
                                    :busi_name1, :busi_about1, :busi_goods1, :busi_sales1, :busi_stro1, :busi_weak1,
                                    :busi_name2, :busi_about2, :busi_goods2, :busi_sales2, :busi_stro2, :busi_weak2,
                                    :busi_name3, :busi_about3, :busi_goods3, :busi_sales3, :busi_stro3, :busi_weak3)
  end
  
  def set_buyer
    @buyer = Buyer.find(params[:id])
    @b_condits = BuyerCondition.all
  end
  
  def set_show
    @buyer = Buyer.find(params[:id])
  end

  def set_user
    @user = User.find(current_user)
  end

  def set_new
    @industries = Industry.all
    @b_condits = BuyerCondition.all
    @user = User.find(current_user.id)
  end    
  
  def set_association
    @user = User.find(current_user.id)
  end
end