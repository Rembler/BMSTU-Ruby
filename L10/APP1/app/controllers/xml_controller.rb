# frozen_string_literal: true

# main working class
class XmlController < ApplicationController
  before_action :parse_params, only: :index

  def index
    results = find_gcf_and_lcm(@val1, @val2)
    data = if results.empty?
             { message: "Incorrect input data (num1 = #{@val1}, num2 = #{@val2})" }
           else
             @steps.map { |elem| { first: elem[0], second: elem[1] } }
           end
    data << { gcf: results[0], lcm: results[1] } unless results.empty?
    respond_to do |format|
      format.xml { render xml: data.to_xml }
      format.rss { render xml: data.to_xml }
    end
  end

  def find_gcf_and_lcm(val1, val2)
    @steps = []
    if val1 =~ /\A\d+\z/ && val2 =~ /\A\d+\z/
      newval1 = val1.to_i
      newval2 = val2.to_i
      res1 = find_gcf(newval1, newval2, true)
      res2 = (newval1 * newval2) / res1
      [res1, res2]
    else
      []
    end
  end

  def find_gcf(val1, val2, code)
    @steps << if code
                [val1, val2]
              else
                [val2, val1]
              end
    rem = val1 % val2
    if rem.zero?
      @steps << [rem, val2]
      val2
    else
      find_gcf(val2, rem, !code)
    end
  end

  protected

  def parse_params
    @val1 = params[:num1]
    @val2 = params[:num2]
  end
end
