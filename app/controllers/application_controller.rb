class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:nickname, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
end
