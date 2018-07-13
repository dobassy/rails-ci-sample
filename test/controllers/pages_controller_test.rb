require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get title" do
    get pages_home_url
    assert_select "title", "RailsCiSample-failed"
  end

end
