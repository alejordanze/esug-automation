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

    Scenario: : Try to login without an email
        And I have entered a "password" on the password field
	    When I press the Login button
        Then error message "Login failed." is showed

    Scenario: Try to login without a password
        And I have entered a valid "email" on the email field
        When I press the Login button
        Then error message "Login failed." is showed
    
    Scenario: Try to losin without an email and a password
        When I press the Login button
        Then error message "Login failed." is showed

    Scenario: Login with an incorrect email
        And I have entered an incorrect "email" on the email field
        And I have entered a "password" on the password field
        When I press the Login button
        Then error message "Login failed." is showed

    Scenario: Login with an incorrect password
        And I have entered a valid "email" on the email field
        And I have entered incorrect password on the password field
        When I press the Login button
        Then error message "Login failed." is showed

    Scenario: validate the user's email format
        And I have entered a long email on the email field
        When I press the Login button
        Then error message "Login failed." is showed

    Scenario: Login with a password over 1000 characters in length
        And I have entered long password on the "password" field
        When I press the Login button
        Then error message "Login failed." is showed

    
    Scenario: validate the user's password format
        And I have entered a valid "email" on the email field
        And I have entered SQLinjection on the password field
        When I press the Login button
        Then error message "Utiliza un formato que coincida con el solicitado" is showed

    Scenario: Press login several times
        When I press LOGIN button many times
        Then error message "Login failed." is showed

    Scenario: Login with an email over 1000 characters in length
        And I have entered a long email on the email field
        When I press the Login button
        Then error message "Login failed." is showed
