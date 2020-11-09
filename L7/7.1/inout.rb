# frozen_string_literal: true

require_relative 'doer'
require_relative 'generator'

fill_file
puts 'Input file data:'
puts File.read(INFNAME)
puts 'Output file data:'
puts do_it(INFNAME, OUTFNAME)
