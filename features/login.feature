Feature: Login

   As a user
   I want to enter my account
   So I can access my privileged content as a user

    Background: I'm on the login page
    Given I am on the login page

    Scenario: Login as admin
        And I have entered a valid "email" on the email field
        And I have entered a "password" on the password field
	    When I press the Login button
        Then The home page display

    Scenario: : verify that the user needs to have an email
        And I have entered a "password" on the password field
	    When I press the Login button
        Then error message "Login failed." is showed

    Scenario: verify that the user needs to have a password
        And I have entered a valid "email" on the email field
        When I press the Login button
        Then error message "Login failed." is showed
    
    Scenario: verify that the user needs to have an email and a password
    	Given I am on the login page
        When I press the Login button
        Then error message "Login failed." is showed

    Scenario:  validate that the user cant login with an incorrect email
        And I have entered a valid "email" on the email field
        And I have entered a "password" on the password field
        When I press the Login button
        Then error message "Login failed." is showed

    Scenario: validate that the user cant login with an incorrect password
        And I have entered a valid "email" on the email field
        And I have entered incorrect password on the password field
        When I press the Login button
        Then error message "Login failed." is showed

    Scenario: validate the user's email format
        And I have entered a long email on the email field
        When I press the Login button
        Then error message "Login failed." is showed

    Scenario: validate that the user cannot log in with a password over 1000 in length
        And I have entered long password on the "password" field
        When I press the Login button
        Then error message "Login failed." is showed

    
    Scenario: validate the user's password format
        And I have entered a valid "email" on the email field
        And I have entered SQLinjection on the password field
        When I press the Login button
        Then error message "Utiliza un formato que coincida con el solicitado" is showed

    Scenario: validate that the application continues to work by repeatedly pressing login
        When I press LOGIN button many times
        Then error message "Login failed." is showed

    Scenario: validate that the user can't login with an email over 1000 in length
        And I have entered a long email on the email field
        When I press the Login button
        Then error message "Login failed." is showed
