# frozen_string_literal: true

INFNAME = 'F.txt'
OUTFNAME = 'G.txt'
PREFNAME = 'G1.txt'

def do_it(infilepath, outfilepath)
  if (File.exist? infilepath) == false || (File.zero? infilepath)
    'File does not exist or is empty'
  else
    inputdata = File.read(infilepath).split.map(&:to_i)
    newdata = inputdata.find_all { |elem| (elem % 3).zero? && elem % 7 != 0 }.join(' ')
    newdata = 'No such elements in input file' if newdata == ''
    File.write(outfilepath, newdata)
    newdata
  end
end
