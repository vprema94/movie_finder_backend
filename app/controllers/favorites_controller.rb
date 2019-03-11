class FavoritesController < ApplicationController

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
      @favorite = Favorite.find(favorites_params[:id])
      if @favorite.destroy
			render json: @favorite, status: :created
		else
			render json: @favorite.errors.full_messages, status: :unprocessable_entity
		end
   end

	private

	def favorites_params
		params.permit(:movie_id, :user_id)
	end
end
