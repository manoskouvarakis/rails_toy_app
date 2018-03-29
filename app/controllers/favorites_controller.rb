class FavoritesController < ApplicationController
	before_action :logged_in_user

	def create
		@movie = Movie.find(params[:movie_id])
    current_user.favorite(@movie)
   
    respond_to do |format|
      #format.html {  redirect_to(request.referer) }
      format.html {  redirect_to root_url }
      format.js
    end
	end

	def destroy
		@movie = Favorite.find(params[:id]).movie
    current_user.unfavorite(@movie)

    respond_to do |format|
      #format.html {  redirect_to(request.referer) }
      format.html {  redirect_to root_url }
      format.js
    end
	end
end
