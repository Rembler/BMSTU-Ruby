require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Correct" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://localhost:3000/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end

  after(:each) do
    @driver.quit
    # @verification_errors.should == []
    expect(@verification_errors).to eq([])
  end

  it "test_correct" do
    @driver.get @base_url
    @driver.find_element(:id, "num1").click
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys "35"
    @driver.find_element(:id, "num2").click
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys "21"
    @driver.find_element(:name, "commit").click
    # (@driver.findelement(:id, "gcf").text).should == "Greatest common factor:7"
    expect(@driver.find_element(:id, "gcf").text).to eq("Greatest common factor:7")
    expect(@driver.find_element(:id, "lcm").text).to eq("Least common multiple:105")
  end

  it "test_empty" do
    @driver.get @base_url
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys ""
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys ""
    @driver.find_element(:name, "commit").click
    expect(@driver.find_element(:id, "fail").text).to eq("Incorrect data")
  end

  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
