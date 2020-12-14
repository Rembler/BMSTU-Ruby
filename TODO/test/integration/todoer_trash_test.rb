require 'test_helper'

class TodoerTrashTest < ActionDispatch::IntegrationTest
  def setup
    post users_path, params: { user: { name: 'Nina', email: 'nina@yandex.ru', password: '12345678', password_confirmation: '12345678' } }
    post sessions_path, params: { email: 'nina@yandex.ru', password: '12345678' }
    post tasks_path, params: { task: { title: "Do something", is_private: "1", group: "В планах" } }
    @id = Task.find_by(title: "Do something").id
    get trash_path, params: { id: @id }
  end

  test 'correct return to root' do
    get root_path
    assert_response :success
  end

  test 'correct destroy' do
    get del_path, params: { id: @id }
    assert_response :redirect
    assert_redirected_to trash_can_path
    assert_nil Task.find_by(id: @id)
  end

  test 'correct return from trash' do
    get trash_path, params: { id: @id }
    assert_response :redirect
    assert_redirected_to root_path
    assert_equal Task.find(@id).is_in_trash, false
  end

  test 'correct clear trash' do
    post del_all_path
    assert_response :redirect
    assert_redirected_to trash_can_path
    assert_nil Task.find_by(id: @id)
  end
end
