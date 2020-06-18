
# After do 
#     Capybara.current_session.driver.quit
# end

# Before '@maximize' do
#   page.driver.browser.manage.window.maximize
# end

# After((Scenario 'Verify new user registration') -> {
#     Do log(page.find('div#drawer a')[:href])
# });

After("@deleteUser") do
    visit(page.find(:xpath, '/html/body/div/div[1]/main/div/div/div[4]/table/tbody/tr/td[4]/a[2]')[:href])
    visit('http://semantics.bo:8000/ESUG')
    fill_in 'email-login', :with => 'admin@esug.org'
    fill_in 'password-login', :with => '12345678'
    find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click
    click_link('Users')
    visit(find(:xpath, "//tr[contains(.,'mail@mail.com')]/td/a", :text => 'delete')[:href])
end
# do
#     if scenario.name == 'Verify new user registration'
#         visit('http://semantics.bo:8000/ESUG')
#         fill_in 'email-login', :with => 'admin@esug.org'
#         fill_in 'password-login', :with => '12345678'
#         find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click
#         click_link('Users')
#         visit(find(:xpath, "//tr[contains(.,'mail@mail.com')]/td/a", :text => 'delete')[:href])
#     end
# end