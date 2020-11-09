# frozen_string_literal: true

def fill_file
  amount = rand(1..20)
  dataarr = []
  newdataarr = []
  amount.times do
    elem = rand(-100..100)
    dataarr << elem
    newdataarr << elem if (elem % 3).zero? && elem % 7 != 0
  end
  File.write(INFNAME, dataarr.join(' '))
  File.write(PREFNAME, newdataarr.join(' '))
end
