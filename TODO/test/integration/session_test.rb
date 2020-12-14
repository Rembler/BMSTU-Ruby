require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'should reg and log' do
    post users_path, params: { user: { name: 'Nina', email: 'nina@yandex.ru', password: '12345678', password_confirmation: '12345678' } }
    assert_response :redirect
    assert_redirected_to login_path
    post sessions_path, params: { email: 'nina@yandex.ru', password: '12345678' }
    assert_response :redirect
    assert_redirected_to root_path
  end

  test 'should redirect to login' do
    get root_path
    assert_response :redirect
    assert_redirected_to login_path
  end

  test 'should logout' do
    post users_path, params: { user: { name: 'Nina', email: 'nina@yandex.ru', password: '12345678', password_confirmation: '12345678' } }
    post sessions_path, params: { email: 'nina@yandex.ru', password: '12345678' }
    get logout_path
    assert_response :redirect
    assert_redirected_to login_path
  end
end