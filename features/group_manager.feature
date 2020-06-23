Feature: ESUG register as group manager
   As a group manager
   I want to test ESUG registration page for group managers
   so I can add group members for talks

Background:
    Given I am on the login page
    And I login with data below
    |Email:   | mail@mail.com |
    |Password: | 12345678      |
    And I press the Login button

Scenario: Leave fields in blank in group manager register page      
    Given I am on the login page    
    And I press "Group Manager" button
	And I left all fields in blank
	When I press the Next button
	Then error message "This field is required." is showed

Scenario: Verify new user registration
    Given I am on the login page
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
    Then Should show "ESUG 2019 Date and Location Announced" page

@deleteFile
Scenario: Verify download invoice no users in group 
    And I press "Group Management" button
    And I verify that the users group table its empty
    When I press Download Invoice button
    Then The invoice should be downloaded

Scenario: Verify new group user registration
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
    When I press Finalize Registration button on user 1
    Then Should show the user "egarcia@mail.com" in the table

@getPayment
Scenario: Verify payment information form credit card
    And I press "Group Management" button
    And I press "Payment information" button
    And I select "Credit Card" in payment type
    And I see the amount increase 
    When I press Accept button on payment information
    Then I should see "Pay with PayPal" page

Scenario: Verify payment information form credit card
    And I press "Group Management" button
    And I press "Payment information" button
    And I select "Bank transfer" in payment type
    And I see the amount decrease 
    When I press Accept button on payment information
    Then I should see "Registration" page

@deleteFile
Scenario: Verify download invoice with users in group 
    And I press "Group Management" button
    And I verify that exists users in group
    When I press Download Invoice button
    Then The invoice should be downloaded

Scenario: Verify modify attendee information
    And I press "Group Management" button
    And I click modify information on "egarcia@mail.com"
    And I modify the size of Tshirt to "XXL"
    And I unselect Monday from assistance days
    When I press Finalize Registration button on modifiying user
    Then Should show the next information in table
    |Email: 	| egarcia@mail.com   |
    |Fee: 	    | 680 €              |

Scenario: Verify remove user from group
    And I press "Group Management" button
    When I remove user with email "egarcia@mail.com"
    Then User with email "egarcia@mail.com" should dissapear from table

Scenario: Verify remove user while creating in user 1 tab
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

Scenario: Verify remove user while creating in conference 1 tab
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

@deleteUser
Scenario: Verify modify group information
    And I press "Group Management" button
    And I press "Modify Group Information" button
    And I modify contact address to 'Av. Circunvalacion'
    And I press Next button on contact form
    And I modify billing address to 'Av. Circunvalacion'
    And I press Next button on billing form
    When I press Finalize Registration button on modifiying user
    Then I should see "Registration" page
