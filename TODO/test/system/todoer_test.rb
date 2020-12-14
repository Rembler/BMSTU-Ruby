require "application_system_test_case"

class TodoerTest < ApplicationSystemTestCase
  def setup
    User.new(name: 'Ivan', email: 'ivan@gmail.com', password: '12345678').save
    visit login_path
    fill_in 'email', with: 'ivan@gmail.com'
    fill_in 'password', with: '12345678'
    click_on 'commit'
  end

  test 'visit project info' do
    find(:xpath, "//a[@href='/info']").click
    assert_text 'Я все понял'
  end

  test 'visit colleagues' do
    find(:xpath, "//a[@href='/colleagues']").click
    assert_text 'User_from_fixtures'
    find(:xpath, "//a[@href='/colleague?id=1']").click
    assert_text 'В планах'
  end

  test 'correct logout' do
    find(:xpath, "//a[@href='#']").click
    find(:xpath, "//a[@href='/login']").click
    assert_text 'Я тут первый раз'
  end

  test 'correct add card' do
    find(:xpath, "//a[@href='/tasks']").click
    fill_in 'task[title]', with: 'Do something'
    click_on 'commit'
    assert_text 'TODO успешно создан!'
  end

  test 'correct edit user' do
    find(:xpath, "//a[@href='#']").click
    find(:xpath, "//a[@href='/users/#{User.find_by(name: 'Ivan').id}/edit']").click
    fill_in 'user[name]', with: 'Vanya'
    click_on 'commit'
    assert_text 'Данные обновлены'
  end

  test 'visit user info' do
    find(:xpath, "//a[@href='#']").click
    find(:xpath, "//a[@href='/users/#{User.find_by(name: 'Ivan').id}']").click
    assert_text 'Имя'
  end

  test 'visit trash can' do
      find(:xpath, "//a[@href='/trash_can']").click
      assert_equal find(:xpath, "//input").value, "Очистить корзину"
    end
end