require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "UntitledTestCase" do

  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "https://www.google.com/"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "should be okay" do
    @driver.get "http://localhost:3000/signin"
    @driver.find_element(:id, "session_email").click
    @driver.find_element(:id, "session_email").clear
    @driver.find_element(:id, "session_email").send_keys "minesmeshnie@vottak.da"
    @driver.find_element(:id, "session_password").click
    @driver.find_element(:id, "session_password").clear
    @driver.find_element(:id, "session_password").send_keys "1234"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:id, "num1").click
    @driver.find_element(:id, "num1").clear
    @driver.find_element(:id, "num1").send_keys "35"
    @driver.find_element(:id, "num2").click
    @driver.find_element(:id, "num2").clear
    @driver.find_element(:id, "num2").send_keys "21"
    @driver.find_element(:name, "commit").click
    @driver.find_element(:name, "commit").click
    @driver.find_element(:xpath, "(//input[@name='commit'])[2]").click
  end
end
