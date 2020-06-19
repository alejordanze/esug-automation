Given('I press Register option') do
  find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[2]').click 
end

Given('I enter the required fields as below') do |table|
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
          when "Gender"
            find('#gender').find(:xpath, '/html/body/div/div/div/form/div/div[4]/div[7]/div/select').select_option
          when "Tshirt size"
            find('#tshirtSize').find(:xpath, '/html/body/div/div/div/form/div/div[4]/div[8]/div/select').select_option
          when "Food Preference"
            find('#foodPreference').find(:xpath, '/html/body/div/div/div/form/div/div[4]/div[9]/div/select').select_option
      end
  end 
end

Given('I press the Next in {string} form') do |string|
  case string
  when "User"
    find(:xpath, '/html/body/div/div/div/form/div/div[2]/a[2]/span').click
  when "Contact"
    find(:xpath, '/html/body/div/div/div/form/div/div[3]/a[3]/span').click
  when "Conference"
    find(:xpath, '/html/body/div/div/div/form/div/div[4]/a[3]/span').click
  when "Billing"
    find(:xpath, '/html/body/div/div/div/form/div/div[5]/a[3]/span').click
  when "Additional"
    find(:xpath, '/html/body/div/div/div/form/div/div[6]/a[3]/span').click
  when "Finalize Registration"
    find(:xpath, '/html/body/div/div/div/form/div/div[7]/button/span').click
  end
end

When('I enter as admin') do
  fill_in 'email-login', :with => 'admin@esug.org'
  fill_in 'password-login', :with => '12345678'
  find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click
end

Then('I should see my email on accouts') do
  find(:xpath, '/html/body/div/div/div[1]/nav/a[4]').click
end
