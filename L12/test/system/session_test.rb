require 'application_system_test_case'
require 'capybara/rspec'

class SessionTest < ApplicationSystemTestCase
  test 'should do' do
    visit signin_url
    fill_in 'Email', with: 'adsf'
    fill_in 'Password', with: 'afg'
    click_on 'Sign in'
    assert_text 'Invalid email/password combination.'
  end

  test 'should do do' do
    User.new(email: 'user@example.com', password: 'password').save
    visit signin_url
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    assert_text 'Input data'
  end

  test 'should do do do' do
    visit signup_url
    fill_in 'user[name]', with: 'Name'
    fill_in 'user[email]', with: 'postironiya@ee.net'
    fill_in 'user[password]', with: '1234'
    click_on 'commit'
    assert_text 'Sign in'
  end

  test 'should do do do do' do
    User.new(email: 'user@example.com', password: 'password').save
    visit signin_url
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign in'
    fill_in 'num1', with: '35'
    fill_in 'num2', with: '21'
    click_on 'Calc result'
    assert_text 'Output data'
  end
end
