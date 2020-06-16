
  Given('I have entered a valid {string} on the email field') do |string|
    fill_in 'email-login', :with => 'admin@esug.org'
end

  Given('I have entered a {string} on the password field') do |string|
    fill_in 'password-login', :with => '12345678'
  end
  
 Then('The home page display') do
    visit('http://semantics.bo:8000/ESUG?_s=PMNmHrdnNXB_Ika8&_k=sH6LUPS0mz5YhKR3')
  end
  
  When('I press the Login button') do
    find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click
  end

  Then('An alert is display') do
    page.has_content?(error)
  end

  Given('I have entered long password on the {string} field') do |string|
    fill_in 'password-login', :with => 'EsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsug'
  end

  Given('I have entered incorrect password on the password field') do
    fill_in 'password-login', :with => '87654321'
  end

  Given('I have entered a long email on the email field') do
    fill_in 'email-login', :with => 'EsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsug@mailcom'
  end

  Given('I have entered SQLinjection on the password field') do
    fill_in 'password-login', :with => ') or true--'
  end

  When('I press LOGIN button many times') do
    for i in 1..5
      find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click
    end
  end