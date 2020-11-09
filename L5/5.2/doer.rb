# frozen_string_literal: true

# class responsible for logic
class MinToMax
  def do_it(arg)
    @wordmas = arg.split(' ')
    minmax = @wordmas.each_with_index.minmax_by { |word, _index| word.length }
    @wordmas[minmax[1][1]] = minmax[0][0]
    @wordmas[minmax[0][1]] = minmax[1][0]
    @wordmas
  end
end
