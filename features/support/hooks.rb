
Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

After("@deleteGroupUser") do
    visit(find(:xpath, "//tr[contains(.,'egarcia@mail.com')]/td/a", :text => 'delete')[:href])
end

After("@deleteUser") do
    visit('http://semantics.bo:8000/ESUG')
    fill_in 'email-login', :with => 'admin@esug.org'
    fill_in 'password-login', :with => '12345678'
    find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click
    click_link('Users')
    visit(find(:xpath, "//tr[contains(.,'mail@mail.com')]/td/a", :text => 'delete')[:href])
end