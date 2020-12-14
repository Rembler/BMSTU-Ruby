require 'test_helper'

class ColleaguesControllerTest < ActionDispatch::IntegrationTest
  test 'redirect to login' do
    get colleagues_path
    assert_response :redirect
    assert_redirected_to login_path
  end
end
