require 'test_helper'

class EuclidControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'should get input' do
    get euclid_index_url
    assert_response :success
  end

  test 'should get output' do
    get euclid_output_url
    assert_response :success
  end

  test 'should get 5 for 25 and 35' do
    get euclid_output_url, params: {num1: 25, num2: 35}
    assert_equal assigns[:resultgcf], 5
  end

  test 'should get 175 for 25 and 35' do
    get euclid_output_url, params: {num1: 25, num2: 35}
    assert_equal assigns[:resultlcm], 175
  end

  test 'should get incorrect data' do
    get euclid_output_url, params: {num1: 'NaN', num2: 325}
    assert_nil assigns[:resultgcf]
  end
end
