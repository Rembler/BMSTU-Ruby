# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'correct save' do
    instance = User.new(name: 'Oda Nobunaga', email: 'oda@gmail.com', password: '12345678')
    assert instance.save
  end

  test 'correct get' do
    instance = User.new(name: 'Isoroku Yamamoto', email: 'isoroku@mail.ru', password: '12345678')
    assert_equal instance.name, 'Isoroku Yamamoto'
  end

  test 'correct destroy' do
    instance = User.new(name: 'Heitaro Kimura', email: 'heitaro@bmstu.ru', password: '12345678')
    assert instance.destroy
  end

  test 'error not uniq email' do
    f_instance = User.new(name: 'Masatane Kanda', email: 'masa@yandex.ru', password: '12345678')
    f_instance.save
    s_instance = User.new(name: 'Masaki Honda', email: 'masa@yandex.ru', password: '12345678')
    s_instance.validate
    assert_equal s_instance.errors[:email], ['has already been taken']
  end

  test 'error invalid email' do
    instance = User.new(name: 'Toru Okabe', email: 'toru.com', password: '12345678')
    instance.validate
    assert_equal instance.errors[:email], ['is invalid']
  end

  test 'error short password' do
    instance = User.new(name: 'Tateo Katō', email: 'kato@gmail.com', password: '123')
    instance.validate
    assert_equal instance.errors[:password], ['is too short (minimum is 8 characters)']
  end

  test 'error name blank' do
    instance = User.new(email: 'Kuroda@gmail.com', password: '12345678')
    instance.validate
    assert_equal instance.errors[:name], ['can\'t be blank']
  end

  test 'error email blank' do
    instance = User.new(name: 'Samejima Shigeo', password: '12345678')
    instance.validate
    assert_equal instance.errors[:email], ['can\'t be blank', 'is invalid']
  end

  test 'error password blank' do
    instance = User.new(name: 'Shunji Sato', email: 'shunji@rambler.ru')
    instance.validate
    assert_equal instance.errors[:password], ['can\'t be blank', 'is too short (minimum is 8 characters)']
  end
end
