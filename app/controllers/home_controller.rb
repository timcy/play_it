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
end
