def create_user
	FactoryGirl.create(:user)
end

Then(/^I should see the "(.*?)" link$/) do |label|
	expect(page.has_link?(label)).to be true
end

Given(/^I am on the homepage$/) do
	visit root_path
end

Given(/^I am signed in$/) do
	define_user
	create_user
end

