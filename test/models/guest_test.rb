require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  def setup
    @guest = Guest.new(first_name: "Gandalf", last_name: "balbazar")
  end

  test "first_name should be present" do
    @guest.first_name = "   "
    assert_not @guest.valid?
  end

  test "last_name should be present" do
    @guest.last_name = "   "
    assert_not @guest.valid?
  end
end
