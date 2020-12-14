require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test 'error login' do
    visit login_path
    fill_in 'email', with: 'Incorrect email'
    fill_in 'password', with: '123'
    click_on 'commit'
    assert_text 'Неверная почта или пароль'
  end

  test 'correct login' do
    User.new(name: 'Ivan', email: 'ivan@gmail.com', password: '12345678').save
    visit login_path
    fill_in 'email', with: 'ivan@gmail.com'
    fill_in 'password', with: '12345678'
    click_on 'commit'
    assert_text 'Успешный вход!'
  end

  test 'error registration' do
    visit signup_path
    fill_in 'user[name]', with: 'Ivan'
    fill_in 'user[email]', with: 'Incorrect email'
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_on 'commit'
    assert_text 'Не удалось зарегистрироваться'
  end

  test 'correct registration' do
    visit signup_path
    fill_in 'user[name]', with: 'Sergei'
    fill_in 'user[email]', with: 'Sergei@gmail.com'
    fill_in 'user[password]', with: '12345678'
    fill_in 'user[password_confirmation]', with: '12345678'
    click_on 'commit'
    assert_text 'Успешная регистрация!'
  end

  test 'correct way to registration' do
    visit login_path
    find(:xpath, "//a[@href='/signup']").click
    assert_text 'У меня уже есть аккаунт'
  end

  test 'correct way to login' do
    visit signup_path
    find(:xpath, "//a[@href='/login']").click
    assert_text 'Я тут первый раз'
  end
end