Feature: As an admin
	I want to have control of invoices of attendes
	so I will know who has paid and who are not
    
Background:
    Given I am on the login page

@deleteFile
Scenario: Validate that the download invoices part is working
    When I enter as admin
    And I prees "Invoices" option
    And I click "Export all invoices"
    And I click "Download Invoices"
    Then I have invoices.zip 

Scenario: Validate that the payment info is updated when a user is edited
    And I login with data below
        |Email:   | jack@gmail.com |
        |Password: | 12345678      |
    And I press the Login button
    When I press "My Registration" button
    And I press "Modify Registration Information" button
    And I go to Conference
    And I only left Monday
    And I save my Registration
    Then I see my amount as 170

Scenario: Validate that the list of invoices are updated constantly
    When I enter as admin
    And I prees "Invoices" option
    Then I see amount as "170 €" on user "Jack Jonhson"

@restoreUser
Scenario: Select that the paid option is working
    When I enter as admin
    And I prees "Invoices" option
    And I press "Has paid" on user "Jack Jonhson"
    Then user "Jack Jonhson" is marked as Has Paid

Scenario: Verify if the statistics only show valid values
    When I enter as admin
    And I press "Configuration"
    And I press "Fee"
    And I put negative value on "Price for add person to the Social Dinner (Required)"
    And I put negative value on "All Days Fee (Required)"
    And I put negative value on "One Day Fee (Required)"
    And I put negative value on "All Days Fee (Required)"
    And I put negative value on "One Day Fee (Required)"
    And I put negative value on "Paypal Commission Percentage (Required)"
    And I put negative value on "Static Commission Paypal (Required)"
    And I put negative value on "Credit card Commission Percentage (Required)"
    And I save it
    Then I see that values Need to be a positive number
