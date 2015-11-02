require 'test_helper'

class FoodstuffsControllerTest < ActionController::TestCase
  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get load" do
    get :load
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

end
