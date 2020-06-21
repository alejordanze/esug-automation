Before do
  page.driver.browser.manage.window.maximize
end

Before("@getPayment") do
    visit('http://semantics.bo:8000/ESUG')
    fill_in 'email-login', :with => ENV['admin_email']
    fill_in 'password-login', :with => ENV['admin_password']
    find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click
    click_link('Configuration')
    click_link('Fee')
    ENV['PAYPAL_COMMISSION'] = find('#payPalCommissionPercentage')['value']
    ENV['STATIC_COMMISSION'] = find('#staticCommissionPaypal')['value']
end

After("@deleteGroupUser") do
    visit(find(:xpath, `//tr[contains(.,#{ENV['email_delete']})]/td/a`, :text => 'delete')[:href])
end

After("@deleteUser") do
    visit('http://semantics.bo:8000/ESUG')
    fill_in 'email-login', :with => ENV['admin_email']
    fill_in 'password-login', :with => ENV['admin_password']
    find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click
    click_link('Users')
    visit(find(:xpath, "//tr[contains(.,'#{ENV['email_delete']}')]/td/a", :text => 'delete')[:href])
end

After("@deleteFile") do
    File.delete(DOWNLOAD_PATH + "/" +  ENV['file_delete']) if File.exist?(DOWNLOAD_PATH + "/" +  ENV['file_delete'])
end