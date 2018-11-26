class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  # def current_user
  #   @current_user ||= User.find_by_id(session[:user_id])
  # end
  helper_method :current_user
  #
  # def logged_in?
  #   !!current_user
  # end
  helper_method :logged_in?


end
