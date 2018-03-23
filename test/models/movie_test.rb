require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @movie = @user.movies.build(title: "First Movie",content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @movie.valid?
  end

  test "user id should be present" do
    @movie.user_id = nil
    assert_not @movie.valid?
  end

  test "title should be present" do
    @movie.title = "   "
    assert_not @movie.valid?
  end

  test "content should be present" do
    @movie.content = "   "
    assert_not @movie.valid?
  end

  test "order should be most recent first" do
    assert_equal movies(:most_recent), Movie.first
  end
end
