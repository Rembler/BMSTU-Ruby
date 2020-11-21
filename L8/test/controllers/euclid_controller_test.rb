require 'test_helper'

class EuclidControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def generator
    num1 = 1
    num2 = 1
    nod = 1
    rand(1..9).times do
      val1 = [2, 5, 11, 29, 41].sample
      if val1.even?
        nod *= val1
        num1 *= val1
        num2 *= val1
      else
        num1 *= val1
        num2 *= val1 + 2
      end
    end
    [nod, num1, num2]
  end

  # test 'should get input' do
  #   get euclid_index_url
  #   assert_response :success
  # end

  # test 'should get output' do
  #   get euclid_output_url
  #   assert_response :success
  # end

  test 'should get 5 for 25 and 35' do
    25.times do
      values = generator
      get euclid_output_url, params: { num1: values[1], num2: values[2] }
      assert_equal assigns[:resultgcf], values[0]
    end
  end

  # test 'should get incorrect data' do
  #   get euclid_output_url, params: {num1: 'NaN', num2: 325}
  #   assert_equal assigns[:resultgcf], 'Incorrect data'
  # end
end
