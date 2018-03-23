class MoviesController < ApplicationController
	def index
    @movies = Movie.joins(:user).all
  end
end
