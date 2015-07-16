Feature: Websites
	
	Scenario: Checking if on right page
		Given I am on the new website page
		And I am signed in
		Then I should see the Logout button
		And I should see the Read! button