# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'doer'
require_relative 'generator'

# descendant of test class
class TestThis < Minitest::Test
  def test_first
    assert(do_it('F1.txt') == 'No such elements in input file', 'Failure')
  end

  def test_second
    assert(do_it('F2.txt') == '18 3 -24', 'Failure')
  end

  def test_third
    assert(do_it('F3.txt') == 'File does not exist or is empty', 'Failure')
  end

  def test_fourth
    assert(do_it('F4.txt') == 'File does not exist or is empty', 'Failure')
  end

  def test_fifth
    fill_file
    resultfile = File.open(PREFNAME)
    resultdata = resultfile.readline
    assert(do_it(INFNAME, OUTFNAME) == resultdata, 'Failure')
    resultfile.close
  end
end
