# frozen_string_literal: true

def wordgenerator(length)
  ('a'..'z').to_a.sample(length).join
end

def rollin
  rand(1..100)
end

def strgenerator
  minlenght = rand(2..8)
  maxlenght = rand((minlenght + 2)..10)
  minword = wordgenerator(minlenght).upcase
  maxword = wordgenerator(maxlenght).upcase
  amount = rand(2..10)
  step = (100 / amount) + 1
  chance = 0
  minisnotplaced = true
  maxisnotplaced = true
  inputstr = []
  outputstr = []
  amount.times do
    chance += step
    word = wordgenerator(rand((minlenght + 1)..(maxlenght - 1)))
    inputstr << word
    outputstr << word
    rollmin = rollin
    if rollmin <= chance && minisnotplaced
      inputstr << minword
      outputstr << maxword
      minisnotplaced = false
    end
    rollmax = rollin
    if rollmax <= chance && maxisnotplaced
      inputstr << maxword
      outputstr << minword
      maxisnotplaced = false
    end
  end
  [inputstr, outputstr]
end
