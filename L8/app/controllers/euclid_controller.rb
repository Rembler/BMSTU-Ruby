# frozen_string_literal: true

# main working class
class EuclidController < ApplicationController
  before_action :parse_params, only: :output

  def index; end

  def output
    @code = true
    @stepsf = []
    @stepss = []
    if @val1 =~ /\A\d+\z/ && @val2 =~ /\A\d+\z/
      fnumw = @val1.to_i
      snumw = @val2.to_i
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
      @resultlcm = (@val1.to_i * @val1.to_i) / @resultgcf
    else
      @code = false
    end
  end

  protected

  def parse_params
    @val1 = params[:num1]
    @val2 = params[:num2]
  end
end
