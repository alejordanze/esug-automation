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


After("@restoreUser") do
    visit('http://semantics.bo:8000/ESUG')
    fill_in 'email-login', :with => ENV['admin_email']
    fill_in 'password-login', :with => ENV['admin_password']
    find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click

    find(:xpath, '/html/body/div/div/div[1]/nav/a[6]').click
    @tr = find('tr', text: ENV['user_restore_name'])
    @tr.find('.mdl-checkbox__input').click
    
    click_link('Logout')

    fill_in 'email-login', :with => "jack@gmail.com"
    fill_in 'password-login', :with => "12345678"
    find(:xpath, '/html/body/div[1]/div/div/div/div[1]/form/button[1]/span').click

    click_link('My Registration')

    find(:xpath, '/html/body/div/div/main/div/div/div[2]/div/a[1]/span').click

    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[2]/a[2]/span').click

    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/div[3]/label/span[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/div[4]/label/span[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/div[5]/label/span[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/div[6]/label/span[3]/span').click

    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/a[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[4]/a[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[5]/a[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[6]/button/span').click
end