require File.dirname(__FILE__) + "/test_helper"
require "active_record"
require "app/models/user"

class UserTest < Minitest::Test
  def test_initialize_with_attributes
    user = User.new(id: 1, name: "Marc")
    assert_equal 1, user.id
    assert_equal "Marc", user.name
  end

  def test_find
    user = User.find(1)
    assert_kind_of User, user
    assert_equal 1, user.id
  end

  def test_all
    users = User.all
    assert_kind_of Array, users
    assert_kind_of User, users.first
    assert_equal 1, users.first.id
  end

  def test_table_name
    assert_equal "users", User.table_name
  end
end
