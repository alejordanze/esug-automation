Feature: ESUG register as group manager
   As a group manager
   I want to test ESUG registration page for group managers
   so I can add group members for talks


Scenario: Leave fields in blank in group manager register page      
	Given I am on the login page
    And I press "Group Manager" button
	And I left all fields in blank
	When I press the "Next" button
	Then error "This field is required." is showed