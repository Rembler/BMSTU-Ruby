require 'test_helper'

class ResultTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  VALUES = [46, 23].freeze

  test 'correct save and get' do
    instance = Result.new
    instance.val1, instance.val2 = VALUES
    assert_equal [instance.val1, instance.val2], VALUES
  end

  test 'correct save db' do
    instance = Result.new(val1: 34, val2: 84, gcf: 34,
                          lcm: 923, st: ActiveSupport::JSON.encode([[9, 42, 452], [4, 45, 32]]))
    assert instance.save
    instance.delete
  end

  test 'error not uniq' do
    f_instance = Result.new(val1: 7, val2: 5, gcf: 45, lcm: 93,
                            st: ActiveSupport::JSON.encode([[45, 56], [46, 23]]))
    f_instance.save
    s_instance = Result.new(val1: 7, val2: 5, gcf: 45, lcm: 93,
                            st: ActiveSupport::JSON.encode([[45, 56], [46, 23]]))
    s_instance.validate
    assert_equal s_instance.errors[:val1], ['has already been taken']
  end

  test 'error not int' do
    instance = Result.new(val1: 'fd', val2: 5, gcf: 45, lcm: 93,
                          st: ActiveSupport::JSON.encode([[45, 56], [46, 23]]))
    instance.validate
    assert_equal instance.errors[:val1], ['is not a number']
  end

  test 'error no gcf' do
    instance = Result.new(val1: 53, val2: 5, lcm: 93,
                          st: ActiveSupport::JSON.encode([[45, 56], [46, 23]]))
    instance.validate
    assert_equal instance.errors[:gcf], ["can't be blank"]
  end
end
