# frozen_string_literal: true

require_relative 'doer'
require 'minitest/autorun'
# descendant of the test class
class TestThis < Minitest::Test
  def test_first
    assert((do_it(1, 2) - 1.339).abs <= 0.001, 'Failure')
  end

  def test_second
    assert((do_it(0, 0) - 3.464).abs <= 0.001, 'Failure')
  end
end
