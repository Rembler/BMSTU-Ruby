# frozen_string_literal: true

def findsquare(steps)
  stepsize = Math::PI / steps
  square = (1..steps).to_a.reduce(0) { |accum, currentpos| accum + 1 + Math.sin(currentpos * stepsize) }
  square * stepsize
end

def do_it(eps)
  steps = 0
  square = 0
  loop do
    steps += 1
    square = findsquare(steps)
    break if (square - Math::PI - 2).abs <= eps
  end
  [square, steps]
end
