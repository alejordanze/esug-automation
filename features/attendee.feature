Feature: As an attendee
	I want to register to the talk
	so I will learn something new

Scenario: Fill registration        
	Given I am on the ESUG homepage
	And I click "Register" 
	When I enter the required fields as below
    |First Name: 	    | Brayan             |
    |Last Name: 	    | Sejas              |
    |Email: 	        | brayan@gmail.com   |
    |Password:          | 12345678           | 
    |Confirm Password:  | 12345678           |
    And I click "NEXT"
        And I enter the required fields as below
    |Address:	    	| Av. Calampamapa    |
    |City: 	            | Cochabamba         |
    |Postal/Zipcode:    | 591                |
    |Country:           | Bolivia            |    
    And I click "NEXT"
    And I enter the required fields as below
    And I select "Gender" option as "Male"
    And I select "Tshirt Size" option as "L"
    And I select "Food Preference" option as "Normal"
    And I select days from "Monday" to "Friday"
    And I select the option "to go to the  social Event"
    And I select the option "to be added to the Mailling List"
    And I click "NEXT"
    And I enter the required fields as below
    |Name:	    	    | Sejas              |
    |Address 1: 	    | Av. Calampampa     |
    |City: 	            | Cochabamba         |
    |Postal/Zipcode:    | 591                |     
    And I click "NEXT"
    And I see addition section
    And I click "NEXT"
    And I see payment section
    And I click "FINALIZE REGISTRATION"
    Then the Registration Summary is show
	And my "First Name" name is "Brayan"
