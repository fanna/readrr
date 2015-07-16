Feature: Registration page

  Scenario: Accessing the registration page
    Given I am on the signup page
    And I am not signed in
    When I click on the "Sign up" link
    Then I should be on the registration page
