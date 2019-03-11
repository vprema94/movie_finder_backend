class MoviesController < ApplicationController
   def index
		@movies = Movie.all
		render json: @movies, status: :ok
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			render json: @movie, status: :created
		else
			render json: @movie.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

	def movie_params
		params.require(:movie).permit(:title, :search_id)
	end
end
