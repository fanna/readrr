Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

Given(/^I am on the new website page$/) do
	visit new_website_path
end

Then(/^I should see the Logout button$/) do
	page.has_button?("Logout")
end

And(/^I should see the Read! button$/) do
	page.has_button?("Read!")
end