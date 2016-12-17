class UsersController < ApplicationController
	before_action :require_login, except: [:index, :new, :create]
	def index
	end
	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			redirect_to user_path(user.id)
			else
			flash[:errors] = user.errors.full_messages
			redirect_to :back
		end
	end
	def edit
		user = User.find(params[:id])
	end
	def show
		@user = User.find(params[:id])
		
	end
	def update
	end
	private
		def user_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		end
	
end
