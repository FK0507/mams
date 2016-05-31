class Users::RegistrationsController < Devise::RegistrationsController
before_action :configure_account_params, if: :devise_controller?

  def new
    @user = User.new
   super
  end
  
  def create
   super
  end
  
  # GET /resource/edit
  def edit
   super
  end

  # PUT /resource
  def update
   super
  end

  # DELETE /resource
  def destroy
   super
  end
=begin
  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
=end
  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :gname, :kind, :role])    
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :gname])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end