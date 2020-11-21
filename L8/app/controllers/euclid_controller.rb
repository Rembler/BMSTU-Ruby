class EuclidController < ApplicationController
  def index

  end

  def output
    @code = true
    fnum = params[:num1]
    snum = params[:num2]
    @stepsf = []
    @stepss = []
    if fnum =~ /\A\d+\z/ && snum =~ /\A\d+\z/
      fnumw = fnum.to_i
      snumw = snum.to_i
      while fnumw != 0 && snumw != 0
        @stepsf << fnumw
        @stepss << snumw
        if fnumw > snumw
          fnumw = fnumw % snumw
        else
          snumw = snumw % fnumw
        end
      end
      @stepsf << fnumw
      @stepss << snumw
      @resultgcf = fnumw + snumw
      @resultlcm = (fnum.to_i * snum.to_i) / @resultgcf
    else
      @code = false
    end
  end
end
