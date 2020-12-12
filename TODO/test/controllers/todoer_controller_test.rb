require 'test_helper'

class TodoerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todoer_index_url
    assert_response :success
  end

end
