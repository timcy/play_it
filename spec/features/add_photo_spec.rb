require 'spec_helper'
require 'devise'
describe HomeController do 
	let(:user) {FactoryGirl.create(:user)}

	context "add photo" do
			before do
			# @request.env["devise.mapping"] = Devise.mappings[:user]
      # user = FactoryGirl.create(:user)
      # user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in user
			
			end

			it "Add new ptoto to user" do
				click_link "Add Image"
				expect(page).to have_content("Upload Image")
			end
	end
end