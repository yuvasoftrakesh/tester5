class ApplicationController < ActionController::Base
 helper_method :current_user 
 private
  before_action :authenticate_user!
 def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end
end
