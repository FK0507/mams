class SellersController < ApplicationController
  before_action :sign_in_required, only: [:create]
  before_action :set_seller, only: [:new_summary, :new_detail, :show_detail, :show_summary, :edit, :update, :destroy]
  before_action :set_user, only: [:new_summary, :confirm, :new_detail, :edit]
  before_action :set_show, only: [:show]
  before_action :set_new, only: [:new]
  before_action :set_association, only: [:confirm,:create]
  before_action :set_confirm, only: [:confirm_summary,:confirm_detail]
  before_action :authenticate_user!, only: [:index]
  load_and_authorize_resource
  
  def index
    @sellers = Seller.all
  end

  def new
    if Seller.joins(:users).where(seller_users: {user_id: current_user.id}).empty?
      @seller = Seller.new
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
    #不正なトークンかチェックする
    if double_submit?
      render 'shared/twice.html.erb'
      return
    end

    @seller = Seller.new(seller_params)
    @user.sellers << @seller
    if @seller.save
      flash[:success] = "企業情報を登録しました。"
      redirect_to seller_path(@seller.id)
    else
      render 'static_pages/home'
    end
  end

  def show
    @buyer = current_user.buyers[0] if current_user.kind == "buyer"
  end

  def show_summary
  end

  def show_detail
  end

  def edit  
    @seller = Seller.find(params[:id])
    @industries = Industry.all
    @s_condits = SellerCondition.all
  end

  def confirm_summary
  end

  def confirm_detail
  end

  def update
    if @seller.update(seller_params)
      #保存に成功した場合はトップページへリダイレクト
      flash[:success] = "企業情報を更新しました。"
      redirect_to s_dashboard_user_path(current_user) 
    else
      #保存に失敗した場合には編集画面に戻す
      render 'edit'
    end
  end

  def destroy
    return redirect_to root_url if @seller.nil?
    @seller.destroy
    flash[:success]="企業情報を削除しました。"
    redirect_to request.referrer || root_url
  end  

  def followers
    @title = "Followers"
    @seller = Seller.find(params[:id])
    @followers = @seller.s_relationships.all
  end
  
private
  def seller_params
      params.require(:seller).permit(:cname, :cname_kana, :goods, :dir, :reg, :par, :cap, :adv, :point, :industry_id,
                                    :seller_condition_id, :zip, :pref, :city, :adr, :president, 
                                    :mainbk_name, :mainbk_kind, :mainbk_branch, :mainbk_bkind,
                                    :goods_kinds, :goods_stro, :goods_weak, :cust_num, :cust_imp_name1, :cust_imp_vol1,
                                    :cust_imp_reas1, :cust_imp_name2, :cust_imp_vol2, :cust_imp_reas2, :cust_imp_name3,
                                    :cust_imp_vol3, :cust_imp_reas3, :cust_reas, :cust_rela, 
                                    :knowhow_sales_1, :knowhow_sales_2, :knowhow_sales_3, :knowhow_tech_1, :knowhow_tech_2,
                                    :knowhow_tech_3, :knowhow_dev_1, :knowhow_dev_2, :knowhow_dev_3, :knowhow_sup_1, 
                                    :knowhow_sup_2, :knowhow_sup_3, :knowhow_prob, :knowhow_cont_kinds1, :knowhow_cont_con1,
                                    :knowhow_cont_kinds2, :knowhow_cont_con2, :knowhow_cont_kinds3, :knowhow_cont_con3, 
                                    :hr_key_posi1, :hr_key_field1, :hr_key_reas1, :hr_key_posi2, :hr_key_field2, :hr_key_reas2,
                                    :hr_key_posi3, :hr_key_field3, :hr_key_reas3, :hr_hope, :hr_moti, 
                                    :proj_vision, :proj_todo, :proj_prob,
                                    :sh_name1, :sh_num1, :sh_rel1, :sh_pos1, :sh_name2, :sh_num2, :sh_rel2, :sh_pos2,
                                    :sh_name3, :sh_num3, :sh_rel3, :sh_pos3, :sh_name4, :sh_num4,:sh_rel4, :sh_pos4,
                                    :sh_name5, :sh_num5, :sh_rel5, :sh_pos5,:sh_about,
                                    :phil_p, :phil_f, :d_point, :reason, :req, :condit_must1, :condit_must2,
                                    :condit_must3, :condit_better1, :condit_better2, :condit_better3, :condit_other,
                                    :busi_name1, :busi_about1, :busi_goods1, :busi_sales1, :busi_stro1, :busi_weak1,
                                    :busi_name2, :busi_about2, :busi_goods2, :busi_sales2, :busi_stro2, :busi_weak2,
                                    :busi_name3, :busi_about3, :busi_goods3, :busi_sales3, :busi_stro3, :busi_weak3,
                                    :busi_unit, :busi_about,
                                    :aff_yn, :aff_name1,:aff_sh1_name1, :aff_sh1_per1, :aff_sh2_name1, :aff_sh2_per1,
                                    :aff_sh3_name1, :aff_sh3_per1, :aff_busi1, :aff_name2, :aff_sh1_name2, :aff_sh1_per2, 
                                    :aff_sh2_name2, :aff_sh2_per2, :aff_sh3_name2, :aff_sh3_per2, :aff_busi2, :aff_name3,
                                    :aff_sh1_name3, :aff_sh1_per3, :aff_sh2_name3, :aff_sh2_per3, :aff_sh3_name3, 
                                    :aff_sh3_per3, :aff_busi3, :aff_about,
                                    :eq_kind1, :eq_name1, :eq_year1, :eq_point1, :eq_kind2, :eq_name2, :eq_year2,
                                    :eq_point2, :eq_kind3, :eq_name3, :eq_year3, :eq_point3,
                                    :re_name1, :re_kind1, :re_area1, :re_a_unit1, :re_use1, :re_val1, :re_v_unit1,
                                    :re_name2, :re_kind2, :re_area2, :re_a_unit2, :re_use2, :re_val2, :re_v_unit2,
                                    :re_name3, :re_kind2, :re_area3, :re_a_unit3, :re_use3, :re_val3, :re_v_unit3,
                                    :re_about,
                                    :fi_kind1, :fi_name1, :fi_unit1, :fi_val1, :fi_kind2, :fi_name2, :fi_unit2,
                                    :fi_val2, :fi_kind3, :fi_name3, :fi_unit3, :fi_val3, :fi_about,
                                    :unit, :p_fy_y, :p_fy_m, :pp_fy_y, :pp_fy_m, :ppp_fy_y, :ppp_fy_m, :p_sales, 
                                    :p_cogs, :p_gp, :p_sga, :p_opin, :p_orin, :p_nein, :pp_sales, :pp_cogs, :pp_gp,
                                    :pp_sga, :pp_opin, :pp_orin, :pp_nein, :ppp_sales, :ppp_cogs, :ppp_gp, :ppp_sga,
                                    :ppp_opin, :ppp_orin, :ppp_nein, :sal_name1, :sal_name2, :sal_name3, :sal_val1,
                                    :sal_val2, :sal_val3, :pur_name1, :pur_name2, :pur_name3, :pur_val1, :pur_val2,
                                    :pur_val3, :os_name1, :os_name2, :os_name3, :os_val1, :os_val2, :os_val3,
                                    :p_ca, :p_nca, :p_cl, :p_ncl, :p_na)
  end
  
  def set_seller
    @seller = Seller.find(params[:id])
    @s_condits = SellerCondition.all
  end

  def set_show
    @seller = Seller.find(params[:id])
    @followers = @seller.buyers[0]
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def set_new
     @industries = Industry.all
     @s_condits = SellerCondition.all
     @user = User.find(current_user.id)
  end    
  
  def set_association
    @user = User.find(current_user.id)
  end
  
  def set_confirm
    @seller = Seller.find(params[:id])
    @seller_confirm = seller_params
  end
end