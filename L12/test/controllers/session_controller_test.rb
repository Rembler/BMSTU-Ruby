require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  # test "should get create" do
  #   get session_create_url
  #   assert_response :success
  # end

  test "should get destroy" do
    get session_destroy_url
    assert_response :redirect
    assert_redirected_to signin_url
  end

  test 'should login with good credentials' do
    get new_session_url, params: { login: users(:one).email, password_digest: 'MyString' }
    assert_response :success
  end

  test 'should not login with bad credentials' do
    assert_raises 'InvalidHash' do
      post new_session_url, params: { login: 'chuev', password_digest: VALID_PASSWORD }
    end
  end

  test 'should cho-to' do
    get '/euclid/index'
    assert_response :redirect
    assert_redirected_to signin_url
  end
end
