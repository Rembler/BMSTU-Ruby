# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'doer'
require_relative 'generator'

# descendant of test class
class TestThis < Minitest::Test
  def test_first
    assert(do_it('F1.txt', 'G.txt') == 'No such elements in input file')
  end

  def test_second
    assert(do_it('F2.txt', 'G.txt') == '18 3 -24')
  end

  def test_third
    assert(do_it('F3.txt', 'G.txt') == 'File does not exist or is empty')
  end

  def test_fourth
    assert(do_it('F4.txt', 'G.txt') == 'File does not exist or is empty')
  end

  def test_fifth
    fill_file
    resultfile = File.open(PREFNAME)
    resultdata = resultfile.readline
    assert(do_it(INFNAME, OUTFNAME) == resultdata)
    resultfile.close
  end
end
