class BuyerConditionsController < ApplicationController
  before_action :set_buyer_condition, only: [:show, :edit, :update, :destroy]

  def index
    @buyer_conditions = BuyerCondition.all
  end

  def new
    @b_condition = BuyerCondition.new
  end
  
  def create
    @b_condition = BuyerCondition.new(b_condition_params)
    if @b_condition.save
      flash[:success] = "希望条件を登録しました。"
      redirect_to new_buyer_condition_path
    else
      render 'static_pages/home'
    end
  end

  def edit  
    @b_condition = BuyerCondition.find(params[:id])
  end
  
  def update
    if @buyer_condition.update(b_condition_params)
      #保存に成功した場合はトップページへリダイレクト
      flash[:success] = "買希望条件マスタを更新しました。"
      redirect_to buyer_conditions_path 
    else
      #保存に失敗した場合には編集画面に戻す
      render 'edit'
    end
  end
  
  def destroy
    return redirect_to buyer_conditions_path if @buyer_condition.nil?
    @buyer_condition.destroy
    flash[:success]="買希望条件マスタを削除しました。"
    redirect_to request.referrer || buyer_conditions_path
  end

  private
  def b_condition_params
      params.require(:buyer_condition).permit(:b_condit)
  end
  
  def set_buyer_condition
    @buyer_condition = BuyerCondition.find(params[:id])
  end

end
