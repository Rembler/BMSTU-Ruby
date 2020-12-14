require 'test_helper'

class TodoerBaseTest < ActionDispatch::IntegrationTest
  def setup
    post users_path, params: { user: { name: 'Nina', email: 'nina@yandex.ru', password: '12345678', password_confirmation: '12345678' } }
    post sessions_path, params: { email: 'nina@yandex.ru', password: '12345678' }
    @id = User.find_by(email: 'nina@yandex.ru').id
  end

  test 'correct get info' do
    get "/users/#{@id}"
    assert_response :success
  end

  test 'correct get info edit' do
    get "/users/#{@id}/edit"
    assert_response :success
  end

  test 'correct user edit' do
    patch "/users/#{@id}", params: { user: { name: 'NeNina', email: 'nina@yandex.ru' } }
    assert_response :redirect
    assert_redirected_to root_path
    assert_equal User.find(@id).name, 'NeNina'
  end

  test 'correct delete user' do
    delete "/users/#{@id}"
    assert_response :redirect
    assert_redirected_to login_path
    assert_nil User.find_by(id: @id)
  end

  test 'correct get trash can' do
    get trash_can_path
    assert_response :success
  end

  test 'correct get logout' do
    get logout_path
    assert_response :redirect
    assert_redirected_to login_path
  end

  test 'redirect from user to warning' do
    get "/users/#{@id - 1}"
    assert_response :redirect
    assert_redirected_to warning_path
  end

  test 'redirect from edit user to warning' do
    get "/users/#{@id - 1}/edit"
    assert_response :redirect
    assert_redirected_to warning_path
  end

  test 'correct get edit task' do
    get tasks_path
    assert_response :success
  end

  test 'correct create new task' do
    post tasks_path, params: { task: { title: "Do something", is_private: "1", group: "В планах" } }
    assert_response :redirect
    assert_redirected_to root_path
  end
end