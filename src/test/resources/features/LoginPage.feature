Feature: Login to HRM Application

  Background:
    Given User is on Home page

  @ValidCredentials
  Scenario: Login with valid credentials - Feature 1, Scenario - 1

    When User enters username as "Admin" and password as "admin123"
    Then User should be able to login successfully
    Then Log network logs

  @InvalidCredentials
  Scenario Outline: Login with invalid credentials - Feature 1, Scenario - 2

    When User enters username as "<username>" and password as "<password>"
    Then User should be able to see error message "<errorMessage>"

    Examples:
      | username   | password  | errorMessage                      |
      | Admin      | admin12$$ | Invalid credentials               |
      | admin$$    | admin123  | Invalid credentials               |
      | abc123     | xyz$$     | Invalid credentials               |


  @MissingUsername
  Scenario: Verify error message when username is missing - Feature 1, Scenario - 3

    When User enters username as "" and password as "admin123"
    Then User should be able to see error message for empty username as "Required"