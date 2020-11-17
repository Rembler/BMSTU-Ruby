# frozen_string_literal: true

require_relative 'doer'
puts 'Enter x'
x = gets.to_f
puts 'Enter y'
y = gets.to_f
puts 'Result:'
puts do_it(x, y)
