require 'test_helper'

class XmlControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'check rss format' do
    get '/', params: { num1: 35, num2: 21, format: :rss }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/rss'
  end

  test 'check xml format' do
    get '/', params: { num1: 35, num2: 21, format: :xml }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xml'
  end
end
