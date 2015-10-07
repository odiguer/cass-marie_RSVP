require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get event" do
    get :event
    assert_response :success
  end

  test "should get wedding_party" do
    get :wedding_party
    assert_response :success
  end

  test "should get travel" do
    get :travel
    assert_response :success
  end

end
