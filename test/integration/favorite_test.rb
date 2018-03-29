require 'test_helper'

class FavoriteTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @movie = movies(:m3)
    log_in_as(@user)
  end

  test "should favorite a movie the standard way" do
    assert_difference '@user.favorite_movies.count', 1 do
      post favorites_path, params: { movie_id: @movie.id }
    end
  end

  test "should favorite a movie with Ajax" do
    assert_difference '@user.favorites.count', 1 do
      post favorites_path, xhr: true, params: { movie_id: @movie.id }
    end
  end

  test "should unfavorite a movie the standard way" do
    @user.favorite(@movie)
    favorite = @user.favorites.find_by(movie_id: @movie.id)
    assert_difference '@user.favorites.count', -1 do
      delete favorite_path(favorite)
    end
  end

	test "should unfavorite a movie with Ajax" do
    @user.favorite(@movie)
    favorite = @user.favorites.find_by(movie_id: @movie.id)
    assert_difference '@user.favorites.count', -1 do
      delete favorite_path(favorite), xhr: true
    end
  end
end
