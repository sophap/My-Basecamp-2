require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get project" do
    get home_project_url
    assert_response :success
  end
end
