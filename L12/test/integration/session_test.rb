require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should login' do
    instance = User.new(email: 'da@a.a', password_digest: 'da')
    instance.save
    get signin_url
    assert_response :success
    post session_index_url, params: { session: { email: 'da@a.a', password: 'da' } }
    assert_response :success
  end

  # test 'should not login' do
  #   assert_raises 'InvalidHash' do
  #     post signin_url, params: { email: 'gmail.com', password_digest: 'parol' }
  #   end
  # end

  # test "can create an article" do
  #   get "/articles/new"
  #   assert_response :success
  #
  #   post "/articles",
  #        params: { article: { title: "can create", body: "article successfully." } }
  #   assert_response :redirect
  #   follow_redirect!
  #   assert_response :success
  #   assert_select "p", "Title:\n can create"
  # end
end
