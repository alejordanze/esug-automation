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
    firstname = find(:xpath, '/html/body/div/div[1]/div/form/div/div[2]/div[1]/div/input')['value']
    log(firstname)
    expect(firstname).to eq('')
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
                @email = value
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
    ENV['email_delete'] = "mail@mail.com"
    expect(page).to have_no_content('New user 1')
end

When('I press Download Invoice button') do
    visit(find('#exportInvoice')[:href])
    sleep 3
end

Then('The invoice should be downloaded') do
    file = Dir.glob(DOWNLOAD_PATH+'/*').max_by(1) {|f| File.mtime(f)}
    fileName = file[0][DOWNLOAD_PATH.size + 1, file[0].size-1]
    ENV['file_delete'] = fileName
    expect(verifyPdfName?(fileName)).to be true
    expect(File.size(DOWNLOAD_PATH + '/' + fileName)).to be > 0
end

def verifyPdfName?(str)
    !!(str =~ /invoice-204[0-9a-z]{21,}.pdf/)
end

Given('I verify that exists users in group') do
    page.has_content?('Payment no registered yet')
end

Given('I verify that the users group table its empty') do
    expect(page).to have_no_selector(:xpath, '/html/body/div/div[1]/main/div/div/div[4]/table/tbody')
end
  
Given('I click {string} on {string}') do |button, email|
    visit(find(:xpath, "//tr[contains(.,'#{email}')]/td/a", :text => 'edit')[:href])
end
  
Given('I modify the size of Tshirt to {string}') do |value|
    select value, :from => "tshirtSize1"
end

Given('I unselect {string} from assistance days') do |string|
    xpath = '/html/body/div/div[1]/main/div/form/div/div/div[2]/div[2]/label'
    css_class = find(:xpath, xpath)[:class]
    if(css_class.include?('is-checked'))
        find(:xpath, xpath).click
    end
    expect(find(:xpath, xpath)[:class]).not_to have_selector '.is-checked'
    find('#conferenceOptionsForm-nextButton').click
end

Given('I press Finalize Registration button on modifiying user') do
    find('#registerButton').click
end

Then('Should show the next information in table') do |table|    
    data = table.rows_hash
    data.each_pair do |key, value|
        case key
            when "Email:"
                expect(find(:xpath, '/html/body/div/div[1]/main/div/div/div[4]/table/tbody/tr/td[2]').text).to eq(value);
            when "Fee:"
                expect(find(:xpath, '/html/body/div/div[1]/main/div/div/div[4]/table/tbody/tr/td[3]').text).to eq(value);
        end
    end
end

Given('I modify contact address to {string}') do |value|
    fill_in 'address', :with => value
end


Given('I modify billing address to {string}') do |value|
    fill_in 'organizationAddrees1', :with => value
end
  
Given('I press Next button on contact form') do
   find('#contactInfoForm-nextButton').click
end

Given('I press Next button on billing form') do
    find('#affiliationInfoForm-nextButton').click
 end
  
When('I press Finalize Registation button') do
    click_link('Finalize Registration')
end
  
Then('I should see {string} page') do |text|
    page.has_content?(text)
end

Given('I select {string} in payment type') do |value|
    select value, :from => "6"
end
  
When('I press Accept button on payment information') do
    find('#accept-change-affiliation').click
end

Given('I see the amount increase') do
    amount = 470 + ((470 * ENV['PAYPAL_COMMISSION'].to_f)/100) + ENV['STATIC_COMMISSION'].to_f
    page.has_content?(amount.to_s)
end

Given('I see the amount decrease') do
    amount = 470
    page.has_content?(amount.to_s)
end