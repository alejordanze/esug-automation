Feature: As an attendee
	I want to register to the talk
	so I will learn something new

Scenario: Fill registration        
	Given I am on the ESUG homepage
	And I click the "REGISTER" 
	When I enter the required fields for user as show below
    |First Name: 	    | Brayan             |
    |Last Name: 	    | Sejas              |
    |Email: 	        | brayan@gmail.com   |
    |Password:          | 12345678           | 
    |Confirm Password:  | 12345678           |
    And I click the "NEXT" button
    And I enter the required fields for contact as show below
    |Address:	    	| Av. Calampamapa    |
    |City: 	            | Cochabamba         |
    |Postal/Zipcode:    | 591                |
    And I select country option as "Bolivia" 
    And I click the "NEXT" button
    And I enter the required fields for conference as show below
    And I select "Gender" option "Male"
    And I select "Tshirt Size" option "L"
    And I select "Food Preference" option "Normal"
    And I select days from "Monday" to "Friday"
    And I select the option "to go to the  social Event"
    And I select the option "to be added to the Mailling List"
    And I click the "NEXT" button
    And I enter the required fields for billing as show below
    |Name:	    	    | Sejas              |
    |Address 1: 	    | Av. Calampampa     |
    |City: 	            | Cochabamba         |
    |Postal/Zipcode:    | 591                |     
    And I click the "NEXT" button
    And I see addition section
    And I click the "NEXT" button
    And I see payment section
    And I click the "FINALIZE REGISTRATION" button
    Then the Registration Summary is show
	And my "First Name" name is "Brayan"

Scenario: Get pdf invoce after I filled registration        
	Given I am on the ESUG homepage
	And I click the "REGISTER" link
	When I enter the required fields for user as show below
    |First Name: 	    | Brayan             |
    |Last Name: 	    | Sejas              |
    |Email: 	        | brayan@gmail.com   |
    |Password:          | 12345678           | 
    |Confirm Password:  | 12345678           |
    And I click the "NEXT" button
    And I enter the required fields for contact as show below
    |Address:	    	| Av. Calampamapa    |
    |City: 	            | Cochabamba         |
    |Postal/Zipcode:    | 591                |
    And I select country option as "Bolivia" 
    And I click the "NEXT" button
    And I enter the required fields for conference as show below
    And I select "Gender" option "Male"
    And I select "Tshirt Size" option "L"
    And I select "Food Preference" option "Normal"
    And I select days from "Monday" to "Friday"
    And I select the option "to go to the  social Event"
    And I select the option "to be added to the Mailling List"
    And I click the "NEXT" button
    And I enter the required fields for billing as show below
    |Name:	    	    | Sejas              |
    |Address 1: 	    | Av. Calampampa     |
    |City: 	            | Cochabamba         |
    |Postal/Zipcode:    | 591                |     
    And I click the "NEXT" button
    And I see addition section
    And I click the "NEXT" button
    And I see payment section
    And I click the "FINALIZE REGISTRATION" button
    Then the Registration Summary is show
	And my "First Name" name is "Brayan"
    And I click "GET INVOICE" button
    And I see my downloaded invoice
