Feature: Login

   In order to validate the login functionality
   As a user
   I want to see the content of the page
   Then I enter with the "login" option

    Scenario: validate that an user can login
        Given Iam in the login page
        And I have entered "admin@esug.org" on the "email-login" field
        And i have entered "12345678" on the "password-login" field
        When I press "login" button
        Then The home page display

    Scenario: : verify that the user needs to have an email
        Given Iam in the login page
        And i have entered "12345678" on the "password-login" field
        When I press "login" button
        Then A "login-alert" is display

    Scenario: verify that the user needs to have a password
        Given Iam in the login page
        And I have entered "admin@esug.org" on the "email-login" field
        When I press "login" button
        Then A "login-alert" is display
    
    Scenario: verify that the user needs to have an email and a password
        Given Iam in the login page
        When I press "login" button
        Then A "login-alert" is display

    Scenario:  validate that the user cant login with an incorrect email
        Given Iam in the login page
        And I have entered "admin@mail.org" on the "email-login" field
        And i have entered "12345678" on the "password-login" field
        When I press "login" button
        Then The home page display

    Scenario: validate that the user cant login with an incorrect password
        Given Iam in the login page
        And I have entered "admin@esug.org" on the "email-login" field
        And i have entered "incorrectPassword" on the "password-login" field
        When I press "login" button
        Then The home page display

    Scenario: validate the user's email format
        # "EsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsugEsug@mail.com"
        Given Iam in the login page
        And I have entered "1000catacteres@mail.com" on the "email-login" field
        When I press "login" button
        Then A "login-alert" is display

    Scenario: validate that the user cannot log in with a password over 1000 in length
        Given Iam in the login page
        And i have entered "1000caracteres" on the "password-login" field
        When I press "login" button
        Then A "login-alert" is display

    
    Scenario: validate the user's password format
        Given Iam in the login page
        And I have entered "admin@esug.org" on the "email-login" field
        And i have entered ") or true--" on the "password-login" field
        When I press "login" button
        Then The home page display

    Scenario: validate that the application continues to work by repeatedly pressing login
        Given Iam in the login page
        And I press "login" button
        And I press "login" button
        And I press "login" button
        And I press "login" button
        When I press "login" button
        Then The home page display

    Scenario: validate that the user can't login with an email over 1000 in length
        Given Iam in the login page
        And I have entered "1000catacteres@mail.com" on the "email-login" field
        When I press "login" button
        Then A "login-alert" is display