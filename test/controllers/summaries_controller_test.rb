require 'test_helper'

class SummariesControllerTest < ActionController::TestCase
  def setup
    @user = users(:olivier)
  end

  test "should get index" do
    log_in_as @user
    get :index
    assert_response :success
  end

  test "should redirect when not logged in" do
    get :index, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end
end
