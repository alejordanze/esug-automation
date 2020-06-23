begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require "selenium/webdriver"
Capybara.default_driver = :selenium

#Admin Login Settings
ENV['admin_email'] = "admin@esug.org"
ENV['admin_password'] = "12345678"

ENV['PAYPAL_COMMISSION'] = "5.4"
ENV['STATIC_COMMISSION'] = "0.3"
#Email to delete
ENV['email_delete'] = ""

#File to delete
ENV['file_delete'] = ""

#User name to restore
ENV['user_restore_name'] = ""

# Set the host the Capybara tests should be run against
Capybara.app_host = ENV["CAPYBARA_HOST"]

# Set the time (in seconds) Capybara should wait for elements to appear on the page
Capybara.default_max_wait_time = 15
Capybara.default_driver = :selenium
Capybara.app_host = "http://www.google.com"

DOWNLOAD_PATH = "\Users\saski\Downloads"

class CapybaraDriver
  # register a Selenium driver for the given browser to run on the localhost
  def self.register_selenium_driver(browser)
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => browser)
    end
  end

end
# Register various Selenium drivers
#CapybaraDriverRegistrar.register_selenium_driver(:internet_explorer)
# CapybaraDriverRegistrar.register_selenium_driver(:firefox)
CapybaraDriver.register_selenium_driver(:chrome)
Capybara.run_server = false

