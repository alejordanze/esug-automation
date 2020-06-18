Given('I am on the ESUG homepage') do
  page.driver.browser.manage.window.maximize
  visit ('http://semantics.bo:8000/ESUG')
end

Given('I click the {string}') do |string|
  find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[2]').clickend

When('I enter the required fields for user as show below') do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
    when "First Name:"
      fill_in 'firstName', :with => value
      @name = value
    when "Last Name:"
      fill_in 'lastName', :with => value
      @lastName = value
    when "Email:"
      fill_in 'email', :with => value
      @email = value
    when "Password:"
      fill_in 'password', :with => value
    when "Confirm Password:"
      fill_in 'confirmPassword', :with => value
      @password = value
    when "Address:"
      fill_in 'address1', :with => value
    when "City:"
      fill_in 'city', :with => value
    when "State/Province:"
      fill_in 'state', :with => value
    when "Postal Code:"
      fill_in 'postalCode', :with => value
    when "Country:"
      select(value, :from => 'country')
    when "User Name:"
      fill_in 'email', :with => value
      @userName = value
    end
end

When('I click the {string} button') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I enter the required fields for contact as show below') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

When('I select {string} option as {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I enter the required fields for conference as show below') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I select days from {string} to {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I select the option {string}') do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I enter the required fields for billing as show below') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

When('I see addition section') do
  pending # Write code here that turns the phrase above into concrete actions
end

When('I see payment section') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('the Registration Summary is show') do
  pending # Write code here that turns the phrase above into concrete actions
end

Then('my {string} name is {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end