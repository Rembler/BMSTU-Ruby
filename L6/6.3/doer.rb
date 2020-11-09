# frozen_string_literal: true

def do_it(steps, top, bottom)
  square = 0
  stepsize = (top - bottom).to_f / steps
  (bottom..top).step(stepsize) { |currentpos| square += yield(currentpos) }
  square * stepsize
end
