require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be search a user" do
    user = User.search('Zacarias', 1)
    assert_equal user[0].name, 'Zacarias'
  end

  test "should be search a blank user and return all users" do
    user = User.search('', 1)
    assert_equal user.count, User.all.count
  end
end
