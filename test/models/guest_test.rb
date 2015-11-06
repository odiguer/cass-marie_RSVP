require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  def setup
    @guest = Guest.new(full_name: "Gandalf balbazar")
  end

  test "full_name should be present" do
    @guest.full_name = "   "
    assert_not @guest.valid?
  end
end
