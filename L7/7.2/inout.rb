# frozen_string_literal: true

require_relative 'doer'

thiscar = NewCar.new
thiscar.printinfo
puts "Average mileage for this car is #{thiscar.avgmileage} kilometers per year"
