require 'test_helper'

class TodoerColleaguesTest < ActionDispatch::IntegrationTest
  def setup
    post users_path, params: { user: { name: 'Nina', email: 'nina@yandex.ru', password: '12345678', password_confirmation: '12345678' } }
    post users_path, params: { user: { name: 'Roma', email: 'roma@gmail.com', password: '12345678', password_confirmation: '12345678' } }
    post sessions_path, params: { email: 'nina@yandex.ru', password: '12345678' }
  end

  test 'correct get project info' do
    get info_path
    assert_response :success
  end

  test 'correct get all' do
    get colleagues_path do
      assert_response :success
    end
  end

  test 'correct get one' do
    get colleague_path, params: { id: User.find_by(name: 'Roma').id }
    assert_response :success
  end

  test 'redirect trying to see none' do
    get colleague_path, params: { id: 2 }
    assert_response :redirect
    assert_redirected_to not_found_path
  end

  test 'redirect to root trying to see' do
    get colleague_path, params: { id: User.find_by(name: 'Nina').id }
    assert_response :redirect
    assert_redirected_to root_path
  end
end