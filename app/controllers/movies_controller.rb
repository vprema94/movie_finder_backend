class MoviesController < ApplicationController
   def index
		@movies = Movie.all
		render json: @movies, status: :ok
	end

	def create
		@movie = Movie.new(title: movie_params['title'], search_id: movie_params['search_id'], poster: movie_params['poster'])
		if @movie.save
			currentUser = User.find(movie_params[:user_id])
			@movie.users << currentUser
			render json: @movie, status: :created
		else
			render json: @movie.errors.full_messages, status: :unprocessable_entity
		end
	end

	private

	def movie_params
		params.permit(:title, :search_id, :poster, :user_id)
	end
end
