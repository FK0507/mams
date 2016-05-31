class IndustriesController < ApplicationController
  before_action :set_industry, only: [:show, :edit, :update, :destroy]

  def index
    @industries = Industry.all
  end

  def new
    @industry = Industry.new
  end
  
  def create
    @industry = Industry.new(industry_params)
    if @industry.save
      flash[:success] = "業種を登録しました。"
      redirect_to new_industry_path
    else
      render 'static_pages/home'
    end
  end

  def edit  
    @industry = Industry.find(params[:id])
  end
  
  def update
    if @industry.update(industry_params)
      #保存に成功した場合はトップページへリダイレクト
      flash[:success] = "業種マスタを更新しました。"
      redirect_to industries_path 
    else
      #保存に失敗した場合には編集画面に戻す
      render 'edit'
    end
  end
  
  def destroy
    return redirect_to industries_path if @industry.nil?
    @industry.destroy
    flash[:success]="業種マスタを削除しました。"
    redirect_to request.referrer || industries_path
  end
  
  private
  def industry_params
      params.require(:industry).permit(:ind_a, :ind_b)
  end
  
  def set_industry
    @industry = Industry.find(params[:id])
  end

end
