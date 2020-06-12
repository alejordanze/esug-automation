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

When('I left all fields in blank') do
    log('to be implemented')
end
  
When('I press the {string} button') do |buttonName|
    find(:xpath, '/html/body/div/div[1]/div/form/div/div[2]/a[2]').click
end
  
Then('error {string} is showed') do |error|
    page.has_content?(error)
end
