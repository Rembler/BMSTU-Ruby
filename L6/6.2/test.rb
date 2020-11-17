# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'doer'

# descendant of the test class
class TestThis < Minitest::Test
  def test_first
    result = givesquare(0.001)
    puts
    puts result
    puts(Math::PI + 2)
    assert(result - (Math::PI + 2) <= 0.001, 'Failure')
  end

  def test_second
    result = givesquare(0.0001)
    puts
    puts result
    puts(Math::PI + 2)
    assert(result - (Math::PI + 2) <= 0.0001, 'Failure')
  end
end
