# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'doer'

# descendant of test class
class TestThis < Minitest::Test
  def test_first
    thiscar = Car.new
    assert(thiscar.instance_of?(Car), 'Failure')
  end

  def test_second
    thiscar = NewCar.new
    assert(thiscar.instance_of?(NewCar), 'Failure')
  end

  def test_third
    thiscar = NewCar.new
    assert(thiscar.avgmileage == 622, 'Failure')
  end

  def test_fourth
    thiscar = NewCar.new
    assert(thiscar.class.superclass == Car, 'Failure')
  end
end
