require 'test_helper'

class RsvpsControllerTest < ActionController::TestCase
  def setup
    @guest = guests(:one)
  end

  test "should get find" do
    get :find
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guest
    assert_response :success
  end
end
