require 'test_helper'

class EmailControllerTest < ActionController::TestCase
  test "should get unsubscribe" do
    get :unsubscribe
    assert_response :success
  end

  test "should get view_online" do
    get :view_online
    assert_response :success
  end

end
