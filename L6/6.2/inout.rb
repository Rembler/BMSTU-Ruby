# frozen_string_literal: true

require_relative 'doer'
puts 'Enter accuracy:'
accuracy = gets.to_f
puts 'Integral:'
puts givesquare(accuracy)
puts 'Accurate integral:'
puts Math::PI + 2
