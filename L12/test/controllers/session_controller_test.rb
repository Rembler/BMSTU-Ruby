require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should get destroy" do
    get session_destroy_url
    assert_response :redirect
    assert_redirected_to signin_url
  end

  test 'should login' do
    get new_session_url, params: { email: users(:one).email, password_digest: '2341' }
    assert_response :success
  end

  test 'should not login' do
    assert_raises 'InvalidHash' do
      post new_session_url, params: { email: 'gmail.com', password_digest: 'parol' }
    end
  end

  test 'should redirect to signin' do
    get '/euclid/index'
    assert_response :redirect
    assert_redirected_to signin_url
  end
end
