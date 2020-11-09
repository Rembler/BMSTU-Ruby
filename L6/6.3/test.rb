# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'doer'

# descendant of the test class
class TestThis < Minitest::Test
  def test_first
    result = do_it(1000, 1, 0.1) { |x| Math.sin(x) / x }
    puts
    puts result
    puts 0.846
    assert((result - 0.846).abs <= 0.001, 'Failure')
  end

  def test_second
    tan = ->(x) { Math.tan(x + 1) / (x + 1) }
    result = do_it(10_000, 2, 1, tan)
    puts
    puts result
    puts(-0.376)
    assert((result + 0.376).abs <= 0.001, 'Failure')
  end
end
