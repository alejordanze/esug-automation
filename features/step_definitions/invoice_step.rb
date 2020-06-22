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

git
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