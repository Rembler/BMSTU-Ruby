require 'nokogiri'
require 'open-uri'

# main working class
class ProxyController < ApplicationController
  before_action :parse_params, only: :output
  before_action :prepare_url, only: :output

  def input; end

  def output
    api_response = open(@url)
    if @side == 'server'
      @result = xslt_transform(api_response).to_html
    elsif @side == 'client-xslt'
      render xml: insert_browser_xslt(api_response).to_xml
    else
      render xml: api_response
    end
  end

  private

  BASE_API_URL = 'http://localhost:3000/?format=xml'.freeze
  XSLT_SERVER_TRANSFORM = "#{Rails.root}/public/server_transform.xslt".freeze
  XSLT_BROWSER_TRANSFORM = '/browser_transform.xslt'.freeze

  def parse_params
    @val1 = params[:num1]
    @val2 = params[:num2]
    @side = params[:side]
  end

  def prepare_url
    @url = BASE_API_URL + "&num1=#{@val1}&num2=#{@val2}"
  end

  def xslt_transform(data, transform: XSLT_SERVER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XSLT(File.read(transform))
    xslt.transform(doc)
  end

  def insert_browser_xslt(data, transform: XSLT_BROWSER_TRANSFORM)
    doc = Nokogiri::XML(data)
    xslt = Nokogiri::XML::ProcessingInstruction.new(doc,'xml-stylesheet',
                                                    'type="text/xsl" href="' + transform + '"')
    doc.root.add_previous_sibling(xslt)
    doc
  end
end

