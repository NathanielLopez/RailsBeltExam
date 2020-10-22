class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:id]) if session[:id]
  end
  helper_method :current_user

  def require_login
    redirect_to '/' unless current_user
  end

  before_action :require_login
end
