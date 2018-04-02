require 'test_helper'

class UserPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_page_index_url
    assert_response :success
  end

end
