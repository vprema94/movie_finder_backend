class AuthController < ApplicationController
	before_action :authorized, except: [:create]

 	def create
	  @user = User.find_by(username: user_login_params[:username])
	  if @user && @user.authenticate(user_login_params[:password])
			token = encode_token({ user_id: @user.id })
			render json: { user: @user, jwt: token }, status: :accepted
	  else
			render json: { message: 'Invalid username or password' }, status: :unauthorized
	  end
	end

 	private

 	def user_login_params
		params.permit(:username, :password)
	end
end