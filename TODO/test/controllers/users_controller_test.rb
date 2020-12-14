require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: 'nikita@mail.ru', name: 'Nikita', password: '12345678', password_confirmation: '12345678' } }
    end

    assert_redirected_to login_path
  end

  test "redirect to login from user" do
    get '/users/1'
    assert_response :redirect
    assert_redirected_to login_path
  end

  test "redirect to login from edit user" do
    get '/users/1/edit'
    assert_response :redirect
    assert_redirected_to login_path
  end
end
