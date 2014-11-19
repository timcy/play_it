class HomeController < ApplicationController
	def index
		if current_user
			puts "i am in current_user"
			redirect_to profile_path
		else
			redirect_to new_user_session_path
		end
	end

	def profile
		@warn=params[:warning]
	end

	def send_bulk_email
	    require 'sendgrid-ruby'
		client = SendGrid::Client.new(api_user: 'snlkumar', api_key: 'P@ssw0rd')
		mail = SendGrid::Mail.new
		mail.from = 'admin@gmail.com'
		mail.to = ['rbin@sendgrid.com', 'taco@cat.limo']
		mail.subject = 'This is a subject string'
		mail.text = 'WHATTUP KITTY CAT!?'
		puts client.send(mail) 
	end


end
