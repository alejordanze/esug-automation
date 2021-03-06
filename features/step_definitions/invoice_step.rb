When('I prees {string} option') do |string|
    find(:xpath, '/html/body/div/div/div[1]/nav/a[6]').click
end

When('I press {string} on user {string}') do |string, name|
    ENV['user_restore_name'] = name
    @tr = find('tr', text: name)
    @tr.find(:css, '.mdl-checkbox__input').click
end

Then('user {string} is marked as Has Paid') do |name|
    @tr = find('tr', text: name)
    expect(@tr.find(:css, '.mdl-checkbox__input')).to be_checked
end

When('I click {string}') do |string|
    case string
        when "Export all invoices"
            find(:xpath, '/html/body/div/div/main/div/div/div[2]/form/a[1]').click
        when "Download Invoices"
            find(:xpath, '/html/body/div/div[1]/main/div/div/div[2]/form/a[2]').click
            sleep 3
    end
end

Then('I have invoices.zip') do
    file = Dir.glob(DOWNLOAD_PATH+'/*').max_by(1) {|f| File.mtime(f)}
    fileName = file[0][DOWNLOAD_PATH.size + 1, file[0].size-1]
    ENV['file_delete'] = fileName
    expect(verifyZipName?(fileName)).to be true
    expect(File.size(DOWNLOAD_PATH + '/' + fileName)).to be > 0
end

def verifyZipName?(str)
    !!(str =~ /Invoices.zip/)
end

When('I go to Conference') do
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[2]/a[2]/span').click
end

When('I only left Monday') do
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/div[3]/label/span[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/div[4]/label/span[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/div[5]/label/span[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/div[6]/label/span[3]/span').click
end

When('I save my Registration') do
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[3]/a[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[4]/a[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[5]/a[3]/span').click
    find(:xpath, '/html/body/div/div/main/div/form/div/div/div[6]/button/span').click
end

Then('I see my amount as 170') do
    page.has_content?("Payment no registered yet. Amount due: 170 Euro(s)  (NOTE: you could have paid but we could have not registered it yet)")
end

Then('I see amount as {string} on user {string}') do |amount, name|
    @tr = find('tr', text: name)
    @tr.find('td', text: amount)
end

When('I put negative value on {string}') do |fee|
    negative_fee = -100
    @price_social_dinner = "Price for add person to the Social Dinner (Required)"
    @all_days_fee = "All Days Fee (Required)"
    @one_day_fee = "One Day Fee (Required)"
    @paypal_commission = "Paypal Commission Percentage (Required)"
    @static_commission = "Static Commission Paypal (Required)"
    @credit_card_commission = "Credit card Commission Percentage (Required)"
    case fee    
        when @price_social_dinner
            fill_in 'extraPersonSD', :with => negative_fee
        when @all_days_fee
            fill_in 'erfAllDaysFee', :with => negative_fee
        when @one_day_fee
            fill_in 'erfOneDayFee', :with => negative_fee
        when @all_days_fee
            fill_in 'lrfAllDaysFee', :with => negative_fee
        when @one_day_fee
            fill_in 'lrfOneDayFee', :with => negative_fee
        when @paypal_commission
            fill_in 'payPalCommissionPercentage', :with => negative_fee
        when @static_commission
            fill_in 'staticCommissionPaypal', :with => negative_fee
        when @credit_card_commission
            fill_in 'creditCardCommissionPercentage', :with => negative_fee
    end
end

When('I save it') do
    find(:xpath, '/html/body/div/div/main/div/div/div[3]/form/button').click
end

Then('I see that values Need to be a positive number') do
    message = ": Need to be a positive number"
    page.has_content?(@price_social_dinner+message)
    page.has_content?(@all_days_fee+message)
    page.has_content?(@one_day_fee+message)
    page.has_content?(@paypal_commission+message)
    page.has_content?(@static_commission+message)
    page.has_content?(@credit_card_commission+message)
end