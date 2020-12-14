require "application_system_test_case"

class TodoerCardTest < ApplicationSystemTestCase
  def setup
    User.new(name: 'Ivan', email: 'ivan@gmail.com', password: '12345678').save
    visit login_path
    fill_in 'email', with: 'ivan@gmail.com'
    fill_in 'password', with: '12345678'
    click_on 'commit'
    find(:xpath, "//a[@href='/tasks']").click
    fill_in 'task[title]', with: 'Do something'
    click_on 'commit'
    @id = Task.find_by(title: 'Do something').id
  end

  test 'correct move card' do
    find(:xpath, "//a[@href='/move?id=#{@id}']").click
    flag = false
    flag = true if find(:xpath, "//div[@id='in_work']/div[@id='card_#{@id}']")
    assert flag
  end

  test 'correct del card' do
    find(:xpath, "//a[@href='/trash?id=#{@id}']").click
    find(:xpath, "//a[@href='/trash_can']").click
    assert_text 'Do something'
  end

  test 'correct card edit' do
    find(:xpath, "//a[@href='/edit?id=#{@id}']").click
    fill_in 'task[title]', with: 'Do nothing'
    click_on 'commit'
    assert_text 'TODO успешно обновлен!'
  end
end