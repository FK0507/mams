class UsersController < ApplicationController
  before_action :set_user, only: [:show, :s_dashboard]
  load_and_authorize_resource
  
  def show
  end
  
  def s_show
  end

  def b_show
  end

  def s_dashboard
    @seller = Seller.find(@user.sellers[0].id)
    @followers = @seller.buyers[0]
  end
  
  def b_dashboard
  end
  
  private

  def user_params
    params.require(:user).permit(:fname, :gname, :email, :password, :password_confirmation, :kind, :role)
  end  
  
  def set_user
    @user = User.find(params[:id])
  end
end
