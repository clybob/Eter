require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be search a user" do
    user = User.paginate(:per_page => 10, :page => 1,
                                  :conditions => ["name like ?", "Zacarias" + "%"],
                                  :order => "name ASC")
    assert_equal user[0].name, 'Zacarias'
  end

  test "should be search a blank user and return all users" do
    user = User.paginate(:per_page => 10, :page => 1,
                                  :conditions => ["name like ?", "" + "%"],
                                  :order => "name ASC")
    assert_equal user.count, User.all.count
  end
end
