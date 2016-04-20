class SecretsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]

  def index
  	@secrets = Secret.all
  	@user_id = session[:user_id]
  end

  def create
  	secret = User.find(params[:id]).secrets.new(params[:secret].permit(:content, :user_id))
  	secret.save
	redirect_to '/users/'+ params[:id].to_s
  	
  end
  def destroy
  	@user_id = session[:user_id]
  	secret = Secret.find(params[:id])
  	secret.destroy if secret.user == current_user
  	redirect_to '/users/'+ @user_id.to_s
  end
  private
  	def secret_params
  		params.require(:secret).permit(:content)
  	end
end
