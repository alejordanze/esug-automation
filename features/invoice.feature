Feature: As an admin
	I want to have control of invoices of attendes
	so I will know who has paid and who are not

Scenario: Select that the paid option is working
    Given I am in the login page
    And I have entered "admin@esug.org" as my "email"
    And i have entered "12345678" as my "password"
    And I press "login" button
    And I am on "Home" page
    When I prees "Invoices" option
    And I press "Has paid" on user "Brayan"
    Then user "Brayan" is marked

Scenario: Validate that the downloaded invoices part is working
    Given I am in the login page
    And I have entered "admin@esug.org" as my "email"
    And i have entered "12345678" as my "password"
    And I press "login" button
    And I am on "Home" page
    And I prees "Invoices" option
    When I press "EXPORT ALL INVOICE"
    And I press "DOWNLOAD INVOICES"
    And I will see a window to confirm to "Download the zip fie"
    And I press "OK"
    Then I will downloaded a zip file