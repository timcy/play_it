require 'spec_helper'
feature "signing in." do
	scenario 'Signing in via form' do
		user = FactoryGirl.create(:user)

		visit '/'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button "Log in"

		expect(page).to have_content(user.email)
	end
end