class Users::InvitationsController < Devise::InvitationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_company, only: [:new, :create]
  before_action :check_authorization
  
  def new
    if can? :new , :Invitation
      if current_user.kind == "seller" then
        if @seller == [] then
          redirect_to new_seller_path
          flash[:notice] = "売企業情報を登録してから、ユーザーを招待して下さい。"
        end
        elsif current_user.kind == "buyer" then
        if @buyer == [] then
          redirect_to new_buyer_path
          flash[:notice] = "買企業情報を登録してから、ユーザーを招待して下さい。"
        end
      else
      super
      end
    end
  end
  
  def create
    super
    if current_user.kind == "seller" then
      @user.sellers << @seller
    elsif current_user.kind == "buyer" then
      @user.buyers << @buyer
    end
  end

  protected
  
  def configure_permitted_parameters
    #strong parametersを設定し、fname、gname、roleを許可
    devise_parameter_sanitizer.permit(:invite, keys: [:kind, :role])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:fname,:gname,:role])
  end
  
  def set_company
    @user = User.find_by(id: current_user.id)
    if current_user.kind == "seller" then
      @seller = @user.sellers
    elsif current_user.kind == "buyer" then
      @buyer = @user.buyers
    end
  end
  
  private
  def check_authorization
     authorize! :manage, :invitation
  end
  
end