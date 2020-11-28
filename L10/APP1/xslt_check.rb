require 'nokogiri'
doc = Nokogiri::XML(File.read('app2.xml'))
xslt = Nokogiri::XSLT(File.read('transform.xslt'))
puts xslt.transform(doc)
