require 'test_helper'

class GarageControllerTest < ActionController::TestCase
  test "should get clients" do
    get :clients
    assert_response :success
  end

  test "should get projects" do
    get :projects
    assert_response :success
  end

  test "should get tasks" do
    get :tasks
    assert_response :success
  end

end
