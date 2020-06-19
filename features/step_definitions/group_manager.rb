Given('I am on the registration of group manager') do
    visit('http://semantics.bo:8000/ESUG')
end
  
Given('I am on the login page') do
    visit('http://semantics.bo:8000/ESUG')
    page.has_content?('User Login')
end
  
Given('I press {string} button') do |buttonName|
    click_link(buttonName)
end

Given('I click the {string} buttonlink') do |buttonName|
    find(:css, '#contactInfoForm-nextButton').click
end

Given('I press the Next button in group manager form') do
    find(:xpath, '/html/body/div/div[1]/div/form/div/div[2]/a[2]').click
end
  
Given('I click the Next button in contact form') do
    find(:css, '#contactInfoForm-nextButton').click
end
  
When('I press Finalize Registration button on Group Manager registration') do
    find(:xpath, '/html/body/div/div[1]/div/form/div/div[4]/button').click 
end

When('I left all fields in blank') do
    log('to be implemented')
end
  
When('I press the {string} button') do |buttonName|
    find(:xpath, '/html/body/div/div[1]/div/form/div/div[2]/a[2]').click
end
  
Then('error message {string} is showed') do |error|
    page.has_content?(error)
end


Given('I fill the required fields as below') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
        case key
            when "First Name:"
                fill_in 'firstName', :with => value
            when "Last Name:"
                fill_in 'lastName', :with => value
            when "Email:"
                fill_in 'email', :with => value
            when "Password:"
                fill_in 'passwordRegister', :with => value
            when "Confirm Password:"
                fill_in 'confirmPasswordRegister', :with => value
            when "Address:"
                fill_in 'address', :with => value
            when "City:"
                fill_in 'city', :with => value
            when "Country:"
                find('#contactCountry').find(:xpath, '/html/body/div/div[1]/div/form/div/div[3]/div[5]/div/select/option[29]').select_option
            when "Zip Code:"
                fill_in 'postal', :with => value
            when "Name:"
                fill_in 'organizationName', :with => value
            when "Address 1:"
                fill_in 'organizationAddrees1', :with => value
            when "City 1:"
                fill_in 'organizationCity', :with => value
            when "Country 1:"
                find('#organizationCountry').find(:xpath, '/html/body/div/div[1]/div/form/div/div[4]/div[6]/div/select/option[28]').select_option
            when "Zip Code 1:"
                fill_in 'organizationPostal' , :with => value
        end
    end 
end

Given('I login with data below') do |table|
    data = table.rows_hash
    data.each_pair do |key, value|
        case key
            when "Email:"
                fill_in 'email-login', :with => value
            when "Password:"
                fill_in 'password-login', :with => value
        end
    end
end
  
When('I press {string}') do |buttonName|
    click_link(buttonName)
end
  
Then('Should show {string} page') do |text|
    page.has_content?(text)
end

Then('Should show the user {string} in the table') do |email|
    find('tr', text: email)
end
  

Given('I fill the register as below') do |table|
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
            when "Gender:"
                find('#gender1').find(:xpath, '/html/body/div/div[1]/main/div/div/div[6]/form/div/div/div/div[3]/div[7]/div/select/option[1]').select_option
            when "Food Preference:"
                find('#foodPreference1').find(:xpath, '/html/body/div/div[1]/main/div/div/div[6]/form/div/div/div/div[3]/div[9]/div/select/option[2]').select_option
            when "Tshirt Size:"
                select value, :from => "tshirtSize1"
            when "Zip Code 1:"
                fill_in 'monday1' , :with => value
        end
    end 
end

When('I remove user with email {string}') do |email|
    visit(find(:xpath, "//tr[contains(.,'#{email}')]/td/a", :text => 'delete')[:href])
end

Then('User with email {string} should dissapear from table') do |email|
    expect(page).to have_no_content(email)
end

Given('I press Next button on user {int}') do |number|
    find('#basicInfoForm'+number.to_s+'-nextButton').click
end
    
Given('I leave the selected days') do
    log(find('#monday1').text)
end
    
Given('I press Next button on conference {int}') do |number|
    find('#conferenceOptionsForm'+number.to_s+'-nextButton').click
end

Given('I press Finalize Registration button on user {int}') do |number|
    find('#registerButton'+number.to_s).click
end
  
When('I press remove button on user {int}') do |number|
    find('#basicInfoForm'+number.to_s+'-removeRegister').click
end

  
When('I press remove button on user {int} in conference tab') do |number|
    find('#conferenceOptionsForm'+number.to_s+'-removeRegister').click
end

Then('Register form should dissapear') do
    expect(page).to have_no_content('New user 1')
end