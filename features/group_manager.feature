Feature: ESUG register as group manager
   As a group manager
   I want to test ESUG registration page for group managers
   so I can add group members for talks

Background: I'm on the login page
    Given I am on the login page

Scenario: Leave fields in blank in group manager register page          
    And I press "Group Manager" button
	And I left all fields in blank
	When I press the "Next" button
	Then error message "This field is required." is showed

Scenario: Verify new user registration
    And I press "Group Manager" button
    And I fill the required fields as below
    |First Name: 	    | Miguel         |
    |Last Name: 	    | Jordan         |
    |Email: 	        | mail@mail.com  |
    |Password:          | 12345678       |
    |Confirm Password:  | 12345678       |
    And I press the Next button in group manager form
    And I fill the required fields as below
    |Address: 	    | Av. America         |
    |City: 	        | Cochabamba  |
    |Zip Code:      | 1234       |
    |Country: 	    | Bolivia         |
    And I click the Next button in contact form
    And I fill the required fields as below
    |Name: 	    | Miguel Jordan       |
    |Address 1: 	    | Av. America         |
    |Country 1: 	    | Bolivia         |
    |City 1: 	        | Cochabamba  |
    |Zip Code 1:     | 1234       |
    When I press Finalize Registration button on Group Manager registration
    Then Should show "Registration Summary" page

Scenario: Verify new group manager login
    And I login with data below
    |Email:   | mail@mail.com |
    |Password: | 12345678      |
    When I press the Login button
    Then Should show "ESUG 2019 Date and Location Announced" page

Scenario: Verify new group user registration
    And I login with data below
    |Email:   | mail@mail.com |
    |Password: | 12345678      |
    And I press the Login button
    And I press "Group Management" button
    And I press "Register new group user" button
    And I fill the register as below
    |First Name: 	    | Esteban         |
    |Last Name: 	    | Garcia         |
    |Email: 	        | egarcia@mail.com  |
    |Password:          | 12345678       |
    |Confirm Password:  | 12345678       |
    And I press Next button on user 1
    And I fill the register as below
    |Gender: 	    | Male         |
    |Tshirt Size: 	    | XL         |
    |Food Preference: 	| Vegan  |
    And I press Next button on conference 1
    And I left all fields in blank
    When I press Finalize Registration button on user 1
    Then Should show the user "egarcia@mail.com" in the table

Scenario: Verify remove user from group
    And I login with data below
    |Email:   | mail@mail.com |
    |Password: | 12345678     |
    And I press the Login button
    And I press "Group Management" button
    When I remove user with email "egarcia@mail.com"
    Then User with email "egarcia@mail.com" should dissapear from table


Scenario: Verify remove user while creating in user 1 tab
    And I login with data below
    |Email:   | mail@mail.com |
    |Password: | 12345678      |
    And I press the Login button
    And I press "Group Management" button
    And I press "Register new group user" button
    And I fill the register as below
    |First Name: 	    | Esteban         |
    |Last Name: 	    | Garcia         |
    |Email: 	        | egarcia@mail.com  |
    |Password:          | 12345678       |
    |Confirm Password:  | 12345678       |
    When I press remove button on user 1
    Then Register form should dissapear

@deleteUser
Scenario: Verify remove user while creating in conference 1 tab
    And I login with data below
    |Email:   | mail@mail.com |
    |Password: | 12345678      |
    And I press the Login button
    And I press "Group Management" button
    And I press "Register new group user" button
    And I fill the register as below
    |First Name: 	    | Esteban           |
    |Last Name: 	    | Garcia            |
    |Email: 	        | egarcia@mail.com  |
    |Password:          | 12345678          |
    |Confirm Password:  | 12345678          |
    And I press Next button on user 1
    And I fill the register as below
    |Gender: 	        | Male   |
    |Tshirt Size: 	    | XL     |
    |Food Preference: 	| Vegan  |
    When I press remove button on user 1 in conference tab
    Then Register form should dissapear

