# frozen_string_literal: true

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'correct save' do
    instance = Task.new(owner: 1, title: 'Do something', is_private: true, is_in_trash: false, group: 'В планах')
    assert instance.save
  end

  test 'correct get' do
    instance = Task.new(owner: 1, title: 'Do something', is_private: true, is_in_trash: false, group: 'В работе')
    assert_equal instance.title, 'Do something'
  end

  test 'correct destroy' do
    instance = Task.new(owner: 1, title: 'Do something', is_private: true, is_in_trash: false, group: 'В планах')
    assert instance.destroy
  end

  test 'error owner not num' do
    instance = Task.new(owner: 'Someone', title: 'Do it', is_private: true, is_in_trash: false, group: 'В планах')
    instance.validate
    assert_equal instance.errors[:owner], ['is not a number']
  end

  test 'error incorrect group' do
    instance = Task.new(owner: 1, title: 'Do something', is_private: true, is_in_trash: false, group: 'В корзине')
    instance.validate
    assert_equal instance.errors[:group], ['is not included in the list']
  end

  test 'error title blank' do
    instance = Task.new(owner: 1, is_private: true, is_in_trash: false, group: 'В планах')
    instance.validate
    assert_equal instance.errors[:title], ['can\'t be blank']
  end

  test 'error owner blank' do
    instance = Task.new(title: 'Do something', is_private: true, is_in_trash: false, group: 'В планах')
    instance.validate
    assert_equal instance.errors[:owner], ['is not a number', 'can\'t be blank']
  end
end
