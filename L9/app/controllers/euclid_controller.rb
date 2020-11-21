# frozen_string_literal: true

# main controller
class EuclidController < ApplicationController
  def index
  end

  def output
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
      @resultgcf = "Incorrect data"
      @resultlcm = "Incorrect data"
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
end
