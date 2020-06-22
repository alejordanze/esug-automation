Feature: As an admin
	I want to have control of invoices of attendes
	so I will know who has paid and who are not
    
Background: I'm on the login page
    Given I am on the login page

Scenario: Select that the paid option is working
    When I enter as admin
    And I prees "Invoices" option
    And I press "Has paid" on user "Jack Jonhson"
    Then user "Jack Jonhson" is marked as Has Paid

Scenario: Validate that the download invoices part is working
    When I enter as admin
    And I prees "Invoices" option
    And I click "Export all invoices"
    And I click "Download Invoices"
    Then I have invoices.zip 
