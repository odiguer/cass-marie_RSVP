require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  def setup
    @user = users(:olivier)
    @guest = guests(:one)
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

  # test "should get create" do
  #   log_in_as @user
  #   get :create
  #   assert_response :success
  # end

  test "should get edit" do
    log_in_as @user
    get :edit, id: @guest
    assert_response :success
  end

  # test "should get update" do
  #   log_in_as @user
  #   get :update
  #   assert_response :success
  # end

  test "should redirect edit when not logged in" do
    get :edit, id: @guest
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
