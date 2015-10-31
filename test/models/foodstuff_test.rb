require 'test_helper'

class FoodstuffTest < ActiveSupport::TestCase
  def setup
    @foodstuff = Foodstuff.new(foodstuff_name: "Food from Space", foodstuff_description: "Delicious tin can")
  end

  test "foodstuff_name should be present" do
    @foodstuff.foodstuff_name = "   "
    assert_not @foodstuff.valid?
  end
end
