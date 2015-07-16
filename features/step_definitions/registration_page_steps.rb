def define_visitor
	@visitor = { username: "visitor", email: "visitor@example.com", password: "password"}
end

def define_user
	@user = { username: "user", email: "user@example.com", password: "password" }
end

def sign_in
	click_link "Login"
	fill_in "user_login", :with => @user[:username]
	fill_in "user_password", :with => @user[:password]
	click_button "Login"
end

def register
	click_link "Sign up"
	fill_in "user_username", :with => @visitor[:username]
	fill_in "user_email", :with => @visitor[:email]
	fill_in "user_password", :with => @visitor[:password]
	fill_in "user_password_confirmation", :with => @visitor[:password]
	click_button "Sign up"
end


Given(/^I am on the signup page$/) do
	visit new_user_session_path
end

And(/^I am not signed in$/) do
	define_visitor
end

When(/^I click on the "(.*?)" link$/)do |label|
	click_link(label)
end

Then(/^I should be on the registration page$/) do
	expect(current_path).to eql(new_user_registration_path)
end
