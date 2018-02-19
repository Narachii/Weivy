class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resource)
  end

  def after_sign_in_path_for(resource)
    if current_user.sign_in_count == 1
      new_user_path(current_user.id)    
    else
      user_path(current_user.id)    
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:nickname, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
end
