class ApplicationController < ActionController::Base
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
