require 'test_helper'

class AdminUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = AdminUser.new(name: 'himanoa', email: 'matsunoappy@gmail.com', password:"foobar", password_confirmation: "foobar")
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'name be should be present' do
    @user.name = ' '
    assert_not @user.valid?
  end

  test 'email be should be present' do
    @user.email = ' '
    assert_not @user.valid?
  end

  test 'long name' do
    @user.name = 'a' * 255
    assert_not @user.valid?
  end

  test 'long email' do
    @user.name = 'a' * 255 + '@example.com'
    assert_not @user.valid?
  end
  test 'email validation should accept valid addresses' do
    valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn)
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end
end
