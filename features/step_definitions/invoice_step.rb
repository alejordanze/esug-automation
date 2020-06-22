When('I prees {string} option') do |string|
    find(:xpath, '/html/body/div/div/div[1]/nav/a[6]').click
end

When('I press {string} on user {string}') do |string, name|
    @tr = find('tr', text: name)
    @tr.find('.mdl-checkbox__input').click
end

Then('user {string} is marked as Has Paid') do |string|
    @tr.find('.mdl-checkbox__input').should be_checked
end

When('I click {string}') do |string|
    case string
        when "Export all invoices"
            find(:xpath, '/html/body/div/div/main/div/div/div[2]/form/a[2]').click
        when "Download Invoices"
            find(:xpath, '/html/body/div/div/main/div/div/div[2]/form/a[1]').click
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