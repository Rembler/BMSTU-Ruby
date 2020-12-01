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
      if (res = Result.find_by_val1_and_val2(fnum, snum))
        @stepsf, @stepss = ActiveSupport::JSON.decode(res.st)
        # @stepss = ActiveSupport::JSON.decode(res.st[1])
        @resultgcf = res.gcf
        @resultlcm = res.lcm
      else
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
        # @steps = [@stepsf, @stepss]
        @resultgcf = fnumw + snumw
        @resultlcm = (fnum.to_i * snum.to_i) / @resultgcf
        res = Result.create val1: fnum, val2: snum, gcf: @resultgcf,
                            lcm: @resultlcm, st: ActiveSupport::JSON.encode([@stepsf, @stepss])
        res.save
      end
    else
      @code = false
    end
    respond_to do |format|
      format.json do
        render json:
                   { type_code: @code.class.to_s, value_code: @code,
                     type_resultgcf: @resultgcf.class.to_s, value_resultgcf: @resultgcf,
                     type_resultlcm: @resultlcm.class.to_s, value_resultlcm: @resultlcm,
                     type_stepsf: @stepsf.class.to_s, value_stepsf: @stepsf,
                     type_stepss: @stepss.class.to_s, value_stepss: @stepss }
      end
      format.html { render }
    end
  end

  def cached
    result = Result.all.map do |inst|
      { val1: inst.val1, val2: inst.val2,
        gcf: inst.gcf, lcm: inst.lcm,
        st: ActiveSupport::JSON.decode(inst.st) }
    end
    respond_to do |format|
      format.xml { render xml: result.to_xml }
    end
  end
end
