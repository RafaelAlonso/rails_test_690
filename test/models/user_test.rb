require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "#full_name" do
    emilio = users(:emilio)
    assert_equal emilio.full_name, "Emilio Topson"
  end

  test "should be valid in certain cases" do
    user1 = User.new
    assert_not user1.valid?

    user2 = User.new(email: 'gi@harlequina.com')
    assert_not user2.valid?
  end
end
