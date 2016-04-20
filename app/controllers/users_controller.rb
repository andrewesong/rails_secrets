class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

	def show
		@user = User.find(params[:id])
		@secrets = @user.secrets
	end

	def new
	end

	def create
		user = User.new(params[:user].permit(:name, :email, :password, :password_confirmation))
		if user.save
			session[:user_id] = user.id
			redirect_to user
		else
			flash[:regerrors] = user.errors.full_messages
			redirect_to '/users/new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		User.find(params[:id]).update(params[:user].permit(:name, :email))
		redirect_to '/users/'+ params[:id].to_s
	end

	def destroy
		User.delete(params[:id])
		session.clear
		redirect_to '/sessions/new'
	end
end

