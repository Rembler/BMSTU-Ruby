require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'should reg and log' do
    post users_path, params: { user: { email: 'email@email.ru', password: 'net' } }
    assert_response :redirect
    post session_index_url, params: { session: { email: 'email@email.ru', password: 'net' } }
    assert_response :redirect
  end

  test 'should redirect to login' do
    get '/euclid/index'
    assert_response :redirect
    assert_redirected_to signin_url
  end

end
