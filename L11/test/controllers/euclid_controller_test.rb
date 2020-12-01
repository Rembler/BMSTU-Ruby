require 'test_helper'

class EuclidControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get euclid_index_url
    assert_response :success
  end

  test "should get output" do
    get euclid_output_url
    assert_response :success
  end

  test 'should return json' do
    get euclid_output_url, params: { num1: 5, num2: 743, format: 'json' }
    assert_response :success

    assert_includes @response.headers['Content-Type'], 'application/json'
  end

  test 'should cache result in db' do
    before = Result.count
    get euclid_output_url, params: { num1: 43, num2: 854 }
    after = Result.count

    assert_equal before + 1, after
  end

  test 'should respond with different results' do
    get euclid_output_url, params: { num1: 21, num2: 97, format: 'json' }
    first = JSON.parse @response.body

    get euclid_output_url, params: { num1: 24, num2: 99, format: 'json' }
    second = JSON.parse @response.body

    refute_equal first, second
  end
end
