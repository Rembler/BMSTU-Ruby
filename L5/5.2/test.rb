# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'doer'
require_relative 'generator'

# descendant of the test class
class TestThis < Minitest::Test
  def test_first
    testr = strgenerator
    puts 'Original string:'
    puts testr[0].join(' ')
    puts 'New string:'
    puts testr[1].join(' ')
    puts 'Program result:'
    workwith = MinToMax.new
    logicresult = workwith.do_it(testr[0].join(' '))
    puts logicresult.join(' ')
    assert(logicresult == testr[1], 'Failure')
  end
end
