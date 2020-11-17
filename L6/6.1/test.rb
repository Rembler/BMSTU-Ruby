# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'doer'

# descendant of the test class
class TestThis < Minitest::Test
  def test_first
    results = do_it(0.001)
    puts
    puts results[0]
    puts(Math::PI + 2)
    puts results[1]
    assert(results[0] - (Math::PI + 2) <= 0.001, 'Failure')
  end

  def test_second
    results = do_it(0.0001)
    puts
    puts results[0]
    puts(Math::PI + 2)
    puts results[1]
    assert(results[0] - (Math::PI + 2) <= 0.0001, 'Failure')
  end
end
