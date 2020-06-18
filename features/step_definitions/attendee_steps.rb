Given('I am on the ESUG homepage') do
  page.driver.browser.manage.window.maximize
  visit ('http://semantics.bo:8000/ESUG')
end

Given('I click {string}') do |buttonName|
  click_link(buttonName)
end

# When('I click {string}') do |string|
#   find(:xpath, '/html/body/div/div/div/form/div/div[3]/a[3]/span').clickend
# end

When('I enter the required fields as below') do |table|
  data = table.rows_hash
  data.each_pair do |key, value|
    case key
      when "First Name:"
        fill_in 'firstName1', :with => value
      when "Last Name:"
        fill_in 'lastName1', :with => value
      when "Email:"
        fill_in 'email1', :with => value
      when "Password:"
        fill_in 'passwordRegister1', :with => value
      when "Confirm Password:"
        fill_in 'confirmPasswordRegister1', :with => value
      when "Address:"
        fill_in 'address1', :with => value
      when "City:"
        fill_in 'city', :with => value
      when "Postal/Zipcode:"
        fill_in 'postal', :with => value
      when "Name:"
        fill_in 'organizationName', :with => value
      when "Address 1:"
        fill_in 'organizationAddrees1', :with => value
      when "Country:"
        select(value, :from => 'contactCountry')
    end
  end
end

When('I select {string} option as {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I select days from {string} to {string}') do |string, string2|
  pending # Write code here that turns the phrase above into concrete actions
end

When('I select the option {string}') do |string|
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