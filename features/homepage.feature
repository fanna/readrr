Feature: Homepage

	Scenario: Viewing the homepage as a visitor
		Given I am on the signup page
		And I am not signed in
		Then I should see the "Sign up" link

	Scenario: Viewing the homepage as a user
		Given I am signed in
		And I am on the homepage
		Then I should see the Logout button


