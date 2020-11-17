# frozen_string_literal: true

def findsquare(steps)
  square = 0
  stepsize = Math::PI / steps
  steps.times { |currentpos| square += 1 + Math.sin(currentpos * stepsize) }
  square * stepsize
end

def givelist
  Enumerator.new do |element|
    steps = 1
    loop do
      square = findsquare(steps)
      steps += 1
      element << square
    end
  end
end

def givesquare(eps)
  givelist.find { |sum| (sum - (Math::PI + 2)).abs < eps }
end
