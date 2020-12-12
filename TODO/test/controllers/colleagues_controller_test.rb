require 'test_helper'

class ColleaguesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colleagues_index_url
    assert_response :success
  end

end
