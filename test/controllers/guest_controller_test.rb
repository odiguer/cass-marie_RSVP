require 'test_helper'

class GuestControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get list" do
    get :list
    assert_response :success
  end

  test "should get load" do
    get :load
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

end
