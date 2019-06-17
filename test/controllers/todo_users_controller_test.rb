require 'test_helper'

class TodoUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get todo_users_create_url
    assert_response :success
  end

end
