require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test should_get_root_route do
    get index
  end

  test go_to_login do
     get "/login"
     assert_response :success
     assert_template "login/new"
  end

  test go_to_logout do
     get "/logout"
     assert_response :success
     assert_template "login/new"
  end
end
