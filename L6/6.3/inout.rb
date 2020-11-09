# frozen_string_literal: true

require_relative 'doer'
puts 'Choose a function:'
puts '  1) sin(x) / x'
puts '  2) tan(x + 1) / (x + 1)'
code = 0
loop do
  code = gets.to_i
  break if [1, 2].include?(code)

  puts 'Incorrect data'
end
tan = ->(x) { Math.tan(x + 1) / (x + 1) }
if code == 1
  puts do_it(10_000, 1, 0.1) { |x| Math.sin(x) / x }
else
  puts do_it(10_000, 2, 1, &tan)
end
