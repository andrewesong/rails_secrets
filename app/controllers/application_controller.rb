class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
  	redirect_to '/sessions/new' if session[:user_id] == nil
  end

  def require_correct_user
  	user = User.find(params[:id])
  	redirect_to "/users/#{current_user.id}" if current_user !=user
  end
  
end
