class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  include SessionsHelper
  before_action :store_location
  before_action do
    RecordWithOperator.operator = current_user
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => "アクセス権限がありません"
  end

  private
  
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end
=begin
  def logged_in_user
    unless user_signed_in?
      session[:forwarding_url] = request.url if request.get?
      flash[:danger] = "ログインしてください。"
      redirect_to login_url
    end
  end
=end  
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
  def after_sign_in_path_for(resource)
      session[:previous_url] || user_path(resource)
  end
  
=begin
  def set_devise_timeout_flash
    if flash[:timedout]
        flash.keep(:alert)
        redirect_to new_user_session_path
    else
        flash.discard
        redirect_to root_url
    end
  end
=end  
end
