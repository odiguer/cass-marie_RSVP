require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "user@potatos.com", first_name: "Bilbo", last_name: "Bagins", password: "catoncar", password_confirmation: "catoncar")
  end

  test "first_name should be present" do
    @user.first_name = "   "
    assert_not @user.valid?
  end

  test "last_name should be present" do
    @user.last_name = "   "
    assert_not @user.valid?
  end

  test "email should be valid" do
    @user.email = "   "
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[toast@friest.com fire@boolba.com A_US-ER@foo.bar.io first.last@foo.jp george+washington@minas.morgul]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[toast@friest,com fire_at_boolba.org get.right@example. foo@bar_baz.com george@minas+morgul.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present and non-blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length of 6" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
