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