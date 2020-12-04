require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'roma@gmail.com', name: 'yanina', password: '3085' } }
    end

    assert_redirected_to user_url(User.last)
  end

  test 'should not create user' do
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: 'romanegmail', name: 'yanina', password: '34509' } }
    end
  end
end
