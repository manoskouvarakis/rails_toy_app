class MoviesController < ApplicationController
	before_action :movie_owner,     only: :destroy

	def index
    @movies = Movie.all.includes(:user)
  end

  def destroy
    Movie.find(params[:id]).destroy
    flash[:success] = "Movie deleted"
    redirect_to(request.referer)
  end

  private

  	# Confirms an admin user.
    def movie_owner
    	@movie = Movie.find(params[:id])
      redirect_to(root_url) unless current_user?(@movie.user)
    end

end
