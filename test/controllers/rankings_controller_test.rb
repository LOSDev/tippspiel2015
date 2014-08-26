require 'test_helper'

class RankingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get matchday" do
    get :matchday
    assert_response :success
  end

end
