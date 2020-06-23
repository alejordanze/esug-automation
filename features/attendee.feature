Feature: As an attendee
	I want to register to the talk
	so I will learn something new

Background: I'm on the login page
    Given I am on the login page

Scenario: Fill registration        
	And I press Register option 
	When I enter the required fields as below
    |First Name: 	    | Brayan             |
    |Last Name: 	    | Sejas              |
    |Email: 	        | brayan@gmail.com   |
    |Password:          | 12345678           | 
    |Confirm Password:  | 12345678           |
    And I press the Next in "User" form
    And I enter the required fields as below
    |Address:	    	| Av. Calampamapa    |
    |City: 	            | Cochabamba         |
    |Postal/Zipcode:    | 591                |
    |Country:           | Bolivia            |    
    And I press the Next in "Contact" form
    And I enter the required fields as below
    |Gender             |Male                |
    |Tshirt size        |L                   |
    |Food Preference    |Normal              |  
    And I press the Next in "Conference" form
    And I enter the required fields as below
    |Name:	    	    | Sejas              |
    |Address 1: 	    | Av. Calampampa     |
    |Zip Code 1:        | 591                |
    |City 1:            | Cochabamba         |
    And I press the Next in "Billing" form
    And I press the Next in "Additional" form
    And I press the Next in "Finalize Registration" form
    Then Should show the user "brayan@gmail.com" in the table

@deleteUser
Scenario: Verify that my user exists
    When I enter as admin
    Then I should see my email on accouts
    And Should show the user "brayan@gmail.com" in the table