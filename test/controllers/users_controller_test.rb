require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = users(:olivier)
    @user2 = users(:ariane)
  end

  test "should get index" do
    log_in_as @user
    get :index
    assert_response :success
  end

  test "should get new" do
    log_in_as @user
    get :new
    assert_response :success
  end

  test "should get edit" do
    log_in_as @user
    get :edit, id: @user
    assert_response :success
  end

  test "should redirect edit when wrong user" do
    log_in_as @user
    get :edit, id: @user2
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
