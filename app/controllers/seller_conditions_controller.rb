class SellerConditionsController < ApplicationController
  before_action :set_seller_condition, only: [:show, :edit, :update, :destroy]

  def index
    @seller_conditions = SellerCondition.all
  end

  def new
    @s_condition = SellerCondition.new
  end
  
  def create
    @s_condition = SellerCondition.new(s_condition_params)
    if @s_condition.save
      flash[:success] = "希望条件を登録しました。"
      redirect_to new_seller_condition_path
    else
      render 'static_pages/home'
    end
  end

  def edit  
    @s_condition = SellerCondition.find(params[:id])
  end
  
  def update
    if @seller_condition.update(s_condition_params)
      #保存に成功した場合はトップページへリダイレクト
      flash[:success] = "売希望条件マスタを更新しました。"
      redirect_to seller_conditions_path 
    else
      #保存に失敗した場合には編集画面に戻す
      render 'edit'
    end
  end
  
  def destroy
    return redirect_to seller_conditions_path if @seller_condition.nil?
    @seller_condition.destroy
    flash[:success]="売希望条件マスタを削除しました。"
    redirect_to request.referrer || seller_conditions_path
  end

  private
  def s_condition_params
      params.require(:seller_condition).permit(:s_condit)
  end
  
  def set_seller_condition
    @seller_condition = SellerCondition.find(params[:id])
  end

end
