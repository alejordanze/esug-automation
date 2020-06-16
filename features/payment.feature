Feature: As an admin
	I want to select a user that has paid for its registration
	so I will know who are not having doubts

Scenario: Select that the paid option is working
    Given I am in the login page
    And I have entered "admin@esug.org" as my "email"
    And i have entered "12345678" as my "password"
    And I press "login" button
    And I am on "Home" page
    When I prees "Invoices" option
    And I press "Has paid" on user "Brayan"
    Then user "Brayan" is marked