require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Full_check" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "localhost:3000"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    expect(@verification_errors).to eq([])
  end
  
  it "server_ok" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "num1").click
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys "35"
    @driver.find_element(:id, "num2").click
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys "21"
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, "//h1").text).to eq "Ответ сервера"
    expect(@driver.find_element(:xpath, "//tr[2]/td").text).to eq "7"
    expect(@driver.find_element(:xpath, "//tr[2]/td[2]").text).to eq "105"
  end

  it "server_fail" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "num1").click
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys "35k"
    @driver.find_element(:id, "num2").click
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys "21 4"
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, "//h1").text).to eq "Ответ сервера"
    expect(@driver.find_element(:xpath, "//p").text).to eq "Incorrect input data (num1 = 35k, num2 = 21 4)"
  end

  it "browser_ok" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "num1").click
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys "45"
    @driver.find_element(:id, "num2").click
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys "96"
    @driver.find_element(:id, "client-side-xslt\"").click
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, "//h1").text).to eq "Результат обработки браузером"
    expect(@driver.find_element(:xpath, "//tr[2]/td").text).to eq "3"
    expect(@driver.find_element(:xpath, "//tr[2]/td[2]").text).to eq "1440"
  end

  it "browser_fail" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "num1").click
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys "45"
    @driver.find_element(:id, "num2").click
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys "96k"
    @driver.find_element(:id, "client-side-xslt\"").click
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, "//h1").text).to eq "Результат обработки браузером"
    expect(@driver.find_element(:xpath, "//p").text).to eq "Incorrect input data (num1 = 45, num2 = 96k)"
  end

  it "xml_ok" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "num1").click
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys "435"
    @driver.find_element(:id, "num2").click
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys "57"
    @driver.find_element(:id, "client-side").click
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, '//gcf').text).to eq "3"
    expect(@driver.find_element(:xpath, '//lcm').text).to eq "8265"
  end

  it "xml_fail" do
    @driver.get "http://localhost:3001/"
    @driver.find_element(:id, "num1").click
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys "435oo"
    @driver.find_element(:id, "num2").click
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys ""
    @driver.find_element(:id, "client-side").click
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:xpath, '//message').text).to eq "Incorrect input data (num1 = 435oo, num2 = )"
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
