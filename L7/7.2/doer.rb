# frozen_string_literal: true

# base class
class Car
  def initialize(year = 1998, mileage = 10_000)
    @year = year
    @mileage = mileage
  end

  def printinfo
    puts "Year of manufacture: #{@year}"
    puts "Mileage: #{@mileage}"
  end
end

# descendant of Car class
class NewCar < Car
  def initialize(year = 2002, mileage = 11_200, number = 'C521РА', model = 'Volvo', owner = 'Me')
    super(year, mileage)
    @number = number
    @model = model
    @owner = owner
  end

  def printinfo
    super
    puts "Car number: #{@number}"
    puts "Car model: #{@model}"
    puts "Car owner: #{@owner}"
  end

  def avgmileage
    @mileage / (2020 - @year)
  end
end
