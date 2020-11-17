# frozen_string_literal: true

require_relative 'doer'
puts 'Enter accuracy:'
accuracy = gets.to_f
results = do_it(accuracy)
puts 'Number of steps with this accuracy:'
puts results[1]
puts 'Integral:'
puts results[0]
puts 'Accurate integral:'
puts Math::PI + 2
