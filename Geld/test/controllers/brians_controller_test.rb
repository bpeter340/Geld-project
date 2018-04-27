require 'test_helper'

class BriansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get brians_index_url
    assert_response :success
  end

end
