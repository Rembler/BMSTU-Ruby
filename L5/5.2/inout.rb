# frozen_string_literal: true

require_relative 'doer'
puts 'Enter string'
workwith = MinToMax.new
str = gets
puts 'New string'
puts workwith.do_it(str).join(' ')
