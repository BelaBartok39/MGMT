require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "can update first name" do
    users(:regular).update(first_name: "Hanzel")
    assert_equal "Hanzel", users(:regular).first_name
  end
  
  test "has first name" do
    assert_equal "Average", users(:regular).first_name
  end
end
