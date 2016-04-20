class SessionsController < ApplicationController
  def index
  	@name = session[:name]
  end

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:name] = user.name
      redirect_to user
    else
      flash[:errors] = ["Invalid combination"]
      redirect_to new_session_path
    end
  end
  def destroy
  	session.clear
  	redirect_to new_session_path
  end

end