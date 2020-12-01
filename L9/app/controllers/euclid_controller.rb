# frozen_string_literal: true

# main controller
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
    respond_to do |format|
      format.html
      format.json do
        render json:
                   {type_code: @code.class.to_s, value_code: @code,
                    type_resultgcf: @resultgcf.class.to_s, value_resultgcf: @resultgcf,
                    type_resultlcm: @resultlcm.class.to_s, value_resultlcm: @resultlcm,
                    type_stepsf: @stepsf.class.to_s, value_stepsf: @stepsf,
                    type_stepss: @stepss.class.to_s, value_stepss: @stepss}
      end
    end
  end
end
