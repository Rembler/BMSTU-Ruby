require 'test_helper'

class TodoerCardTest < ActionDispatch::IntegrationTest
  def setup
    post users_path, params: { user: { name: 'Nina', email: 'nina@yandex.ru', password: '12345678', password_confirmation: '12345678' } }
    post sessions_path, params: { email: 'nina@yandex.ru', password: '12345678' }
    post tasks_path, params: { task: { title: "Do something", is_private: "1", group: "В планах" } }
    @id = Task.find_by(title: "Do something").id
  end

  test 'correct move to' do
    get move_path, params: { id: @id }
    assert_response :redirect
    assert_redirected_to root_path
    assert_equal Task.find(@id).group, "В работе"
  end

  test 'correct get edit card' do
    get edit_path, params: { id: @id }
    assert_response :success
  end

  test 'correct edit card' do
    patch update_path, params: { task: { title: "Do nothing", is_private: "0", group: "В планах" }, id: @id }
    assert_response :redirect
    assert_redirected_to root_path
    assert_equal Task.find(@id).title, "Do nothing"
  end

  test 'correct send to trash' do
    get trash_path, params: { id: @id }
    assert_response :redirect
    assert_redirected_to root_path
    assert_equal Task.find(@id).is_in_trash, true
  end
end
