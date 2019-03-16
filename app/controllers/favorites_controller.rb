class FavoritesController < ApplicationController
	before_action :authorized, except: [:create, :index]

	def index
		@favorites = Favorite.all
		render json: @favorites, status: :ok
	end

	def create
		@favorite = Favorite.new(movie_id: favorites_params['movie_id'], user_id: favorites_params['user_id'])
		if @favorite.save
			render json: @favorite, status: :created
		else
			render json: @favorite.errors.full_messages, status: :unprocessable_entity
		end
   end
   
	def destroy 
		currentUser = User.find(favorites_params[:user_id])
		@favorite = currentUser.favorites.find_by(movie_id: favorites_params[:movie_id])
      if @favorite.destroy
			render json: @favorite, status: :created
		else
			render json: @favorite.errors.full_messages, status: :unprocessable_entity
		end
   end

	private

	def favorites_params
		params.permit(:user_id, :movie_id)
	end
end
