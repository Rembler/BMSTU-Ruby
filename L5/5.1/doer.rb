# frozen_string_literal: true

def do_it(arx, ary)
  (2 * Math.cos(arx - Math::PI / 6)) / (0.5 + Math.sin(ary)**2)
end
