require 'test_helper'

class FoodstuffsControllerTest < ActionController::TestCase
  def setup
    @user = users(:olivier)
    @foodstuff = foodstuffs(:chicken)
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

  test "should redirect to index after create" do
    log_in_as @user
    post :create, foodstuff: {foodstuff_name: "Beef", foodstuff_description: "This is delicious"}
    assert_redirected_to foodstuffs_path
  end

  test "should get edit" do
    log_in_as @user
    get :edit, id: @foodstuff
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @foodstuff
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
